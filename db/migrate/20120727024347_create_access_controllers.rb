class CreateAccessControllers < ActiveRecord::Migration
  def change
    create_table :access_controllers do |t|

      t.timestamps
    end
  end
end
