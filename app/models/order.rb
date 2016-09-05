class Order < ActiveRecord::Base
  has_one :books
  belongs_to :user
end
