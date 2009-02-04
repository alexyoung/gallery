class Photo < ActiveRecord::Base
  has_many :comments
  
  has_attachment :storage => :file_system,
                 :thumbnails => { :thumb => '160>' },
                 :content_type => :image
  validates_as_attachment
  
  belongs_to :user
  
  validates_presence_of :title, :if => Proc.new { |photo| photo.thumbnail.nil? }
end
