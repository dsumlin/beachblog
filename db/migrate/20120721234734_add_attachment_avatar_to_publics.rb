class AddAttachmentAvatarToPublics < ActiveRecord::Migration
  def self.up
    change_table :publics do |t|
      t.has_attached_file :avatar
      t.integer "avatar_id"
    end
  end

  def self.down
    drop_attached_file :publics, :avatar
  end
end
