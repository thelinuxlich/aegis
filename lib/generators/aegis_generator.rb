class AegisGenerator < Rails::Generators::Base
  desc "Generate a table for special permissions with crud fields"
  
  def manifest
    record do |m|
      m.migration_template 'migration.rb', 'db/migrate', :migration_file_name => 'create_special_permissions'
    end
  end

end
