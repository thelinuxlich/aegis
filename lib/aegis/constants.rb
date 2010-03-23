module Aegis
  module Constants
    EVERYONE_ROLE_NAME = :everyone
    PERMISSION_PREFIX = I18n.translate('aegis.permission_prefix',:default => 'may') 
    CRUD_VERBS = ["create", "read", "update", "destroy"]
  end
end
