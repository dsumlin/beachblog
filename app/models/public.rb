class Public < ActiveRecord::Base
  # attr_accessible :title, :body
  attr_accessible :avatar, :page_id, :name, :visible, :content_type, :content
   has_attached_file :avatar
end
