class Book < ActiveRecord::Base
  belongs_to :user
  belongs_to :order
  has_many :likes
  mount_uploader :content, BookImageUploader

end
