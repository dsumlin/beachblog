class AddAttachmentAvatarToSections < ActiveRecord::Migration
  def self.up
    change_table :sections do |t|
      t.has_attached_file :avatar
    end
  end

  def self.down
    drop_attached_file :sections, :avatar
  end
end
