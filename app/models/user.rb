class User < ActiveRecord::Base
  #set_table_name("admin_users")
   attr_accessible :name, :position, :visible
end
