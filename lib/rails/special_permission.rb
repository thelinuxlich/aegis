class SpecialPermission < ActiveRecord::Base

  validates_presence_of :user_id, :permission_module
  validates_uniqueness_of :permission_module, :scope => 'user_id'
  
  named_scope :writable, lambda {|controller| {:conditions => ['permission_module = ? and permission_write = ?', controller, true]}}
  named_scope :readable, lambda {|controller| {:conditions => ['permission_module = ? and permission_read = ?', controller, true]}}
  named_scope :updatable, lambda {|controller| {:conditions => ['permission_module = ? and permission_update = ?', controller, true]}}
  named_scope :deletable, lambda {|controller| {:conditions => ['permission_module = ? and permission_destroy = ?', controller, true]}}
end
