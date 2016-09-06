class Book < ActiveRecord::Base
  belongs_to :user
  has_one :order
  has_many :likes
  mount_uploader :content, BookImageUploader

end
