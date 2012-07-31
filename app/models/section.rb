require 'position_mover'

class Section < ActiveRecord::Base
  # attr_accessible :title, :body
  include PositionMover
  
  belongs_to :page
  has_many :section_edits
  has_many :editors, :through => :section_edits, :class_name => "AdminUser"
  attr_accessible :avatar, :page_id, :name, :visible, :content_type, :content
  has_attached_file :avatar,
  :storage => :s3,
    :s3_credentials => {
      :bucket            => ENV['S3_BUCKET_NAME'],
      :access_key_id     => ENV['AWS_ACCESS_KEY_ID'],
      :secret_access_key => ENV['AWS_SECRET_ACCESS_KEY']
  CONTENT_TYPES = ['text', 'HTML', 'avatar']
  
  validates_presence_of :name
  validates_length_of :name, :maximum => 255
  validates_inclusion_of :content_type, :in => CONTENT_TYPES,
    :message => "must be one: #{CONTENT_TYPES.join(', ')}"
  validates_presence_of :content
  
  scope :visible, where(:visible => true)
  scope :invisible, where(:visible => false)
  scope :sorted, order('sections.position ASC')
  
  private
  
  def position_scope
    "sections.page_id = #{page_id.to_i}"
  end
  
end
