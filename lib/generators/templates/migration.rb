class CreateSpecialPermissions < ActiveRecord::Migration
  def self.up
    create_table :special_permissions do |t|
      t.integer :user_id
      t.string :permission_module
      t.boolean :permission_read, :default => false
      t.boolean :permission_write, :default => false
      t.boolean :permission_destroy, :default => false
      t.boolean :permission_update, :default => false
      t.timestamps
    end
  end

  def self.down
    drop_table :special_permissions
  end
end
