class Order < ActiveRecord::Base
  belongs_to :user
  belongs_to :book
  has_one :buying
  has_one :selling
end
