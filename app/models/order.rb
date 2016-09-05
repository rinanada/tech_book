class Order < ActiveRecord::Base
  has_one :book
  belongs_to :user
end
