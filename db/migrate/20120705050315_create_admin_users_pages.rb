class CreateAdminUsersPages < ActiveRecord::Migration
  def self.up
    create_table :admin_users_pages, :id => false do |t|
      t.integer "admin_user_id"
      t.integer "page_id"
      t.string "first_name", :limit => 25
      t.string "username", :limit => 50
      t.string "email", :default => "", :null => false
      t.string "password", :limit => 40
      
    end
    add_index :admin_users_pages, ["admin_user_id", "page_id"]
  end

  def self.down
    drop_table :admin_users_pages
  end
end
