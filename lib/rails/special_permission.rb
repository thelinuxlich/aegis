class SpecialPermissions < ActiveRecord::Base

  named_scope :writable, lambda {|controller| {:conditions => ['permission_module = ? and permission_write = ?', controller, true]}}
  named_scope :readable, lambda {|controller| {:conditions => ['permission_module = ? and permission_read = ?', controller, true]}}
  named_scope :updatable, lambda {|controller| {:conditions => ['permission_module = ? and permission_update = ?', controller, true]}}
  named_scope :deletable, lambda {|controller| {:conditions => ['permission_module = ? and permission_destroy = ?', controller, true]}}
end
