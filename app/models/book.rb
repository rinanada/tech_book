class Book < ActiveRecord::Base
  belongs_to :o_user, :class_name => 'User', :foreign_key => 'o_user_id'
  belongs_to :e_user, :class_name => 'User', :foreign_key => 'e_user_id'
  has_one :order
  has_many :likes
  has_many :categories
  mount_uploader :content, BookImageUploader
  acts_as_taggable_on :categories
  def tax
    (price + 200) * 0.08.round
  end

  def total_price
    (price + 200) * 1.08.round
  end
end
