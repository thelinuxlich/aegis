module Aegis
  class Role
  
    attr_reader :name, :default_permission
          
    # permissions is a hash like: permissions[:edit_user] = lambda { |user| ... }
    def initialize(name, permissions, options)
      @name = name
      @permissions = permissions
      @default_permission = options[:default_permission] == :allow ? :allow : :deny
      freeze
    end
    
    def allow_by_default?
      @default_permission == :allow
    end
    
    define_method "#{Aegis::Constants::PERMISSION_PREFIX}?" do |permission,*args|
      # puts "may? #{permission}, #{args}"
      @permissions.send "#{Aegis::Constants::PERMISSION_PREFIX}?",self, permission, *args
    end
    
    def <=>(other)
      name.to_s <=> other.name.to_s
    end

    def to_s
      name.to_s.humanize
    end
    
    def id
      name.to_s
    end

    private
    
    def method_missing(symb, *args)
      method_name = symb.to_s
      if method_name =~ /^#{Aegis::Constants::PERMISSION_PREFIX}_(.+)(\?|\!)$/
        permission, severity = $1, $2
        permission = Aegis::Normalization.normalize_permission(permission)
        may = send "#{Aegis::Constants::PERMISSION_PREFIX}?", permission, *args
        if severity == '!' && !may 
          raise PermissionError, "Access denied: #{permission}" 
        else
          may
        end
      else
        super
      end
    end
        
    
  end
end
