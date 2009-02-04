class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :photo
  validates_presence_of :title, :body
end
