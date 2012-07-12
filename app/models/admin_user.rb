class AdminUser < ActiveRecord::Base
  #set_table_name("admin_users")
   attr_accessible :name, :position, :visible, :first_name, :last_name, :username
   
   has_and_belongs_to_many :pages
   has_many :section_edits
   has_many :sections, :through => :section_edits
   
   EMAIL_REGEX = /^[A-Z0-9._%+-]+@[A-Z0-9.-]+\.[A-Z]{2,4}$/i
   
   validates_presence_of :first_name
   validates_length_of :first_name, :maximum => 25
   validates_presence_of :last_name
   validates_length_of :last_name, :maximum => 50
   validates_presence_of :username
   validates_length_of :username, :within => 8..25
   
   scope :named, lambda {|first,last| where(:first_name => first, :last_name => last)}
   
   
end
