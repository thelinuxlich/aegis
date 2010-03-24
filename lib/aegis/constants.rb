module Aegis
  module Constants
    EVERYONE_ROLE_NAME = :everyone
    PERMISSION_PREFIX = I18n.translate('aegis.permission.prefix',:default => 'may') 
    ADMIN_PREFIX = I18n.translate('aegis.permission.admin', :default => 'admin')
    CRUD_VERBS = [I18n.translate('aegis.permission.create', :default => 'create'),
      I18n.translate('aegis.permission.read', :default => 'read'),
      I18n.translate('aegis.permission.update', :default => 'update'),
      I18n.translate('aegis.permission.destroy', :default => 'destroy')]
  end
end
