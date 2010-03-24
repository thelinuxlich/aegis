module Aegis
  module PermissionFilter
    def self.extended(base)
      base.instance_eval do
        def authorize_first!(current_user)
          before_filter{authorize_action(current_user)}
        end

        protected
          def authorize_action(current_user)
            permission_type = ""
            case action_name
            when "index","show"
              permission_type = Aegis::Constants::CRUD_VERBS[1]
            when "edit","update"
              permission_type = Aegis::Constants::CRUD_VERBS[2]
            when "new,","create"
              permission_type = Aegis::Constants::CRUD_VERBS[0]
            when "destroy"
              permission_type = Aegis::Constants::CRUD_VERBS[3]
            else
              permission_type = action_name
            end
            current_user.send("#{Aegis::Constants::PERMISSION_PREFIX}_#{permission_type}_#{controller_name}?")
          end
      end
    end
  end
end
