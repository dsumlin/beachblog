class CreatePublics < ActiveRecord::Migration
  def change
    create_table :publics do |t|

      t.timestamps
    end
  end
end
