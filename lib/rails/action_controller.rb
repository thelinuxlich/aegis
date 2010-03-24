ActionController::Base.class_eval do
  extend Aegis::PermissionFilter
end
