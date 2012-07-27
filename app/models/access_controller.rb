class AccessController < ActiveRecord::Base
  # attr_accessible :title, :body
  has_attached_file :avatar
  attr_accessible :avatar, :page_id, :name, :visible, :content_type, :content
end
