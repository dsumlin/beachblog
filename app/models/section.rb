class Section < ActiveRecord::Base
  # attr_accessible :title, :body
  belongs_to :page
  has_many :section_edits
  has_many :editors, :through => :section_edits, :class_name => "AdminUser"
  
end
