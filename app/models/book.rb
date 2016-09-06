class Book < ActiveRecord::Base
  belongs_to :o_user, :class_name => 'User', :foreign_key => 'o_user_id'
  belongs_to :e_user, :class_name => 'User', :foreign_key => 'e_user_id'
  has_one :order
  has_many :likes
  mount_uploader :content, BookImageUploader

end
