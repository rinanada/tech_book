class Book < ActiveRecord::Base
  has_many :orders
  has_many :users, through: :orders
  has_many :likes

end
