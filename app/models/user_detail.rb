class UserDetail < ActiveRecord::Base
  belongs_to :user
  has_many :books
  has_many :orders, as: 'ordering'
  validates :lastname,  presence: true
  validates :firstname,     presence: true
  validates :postalcode,   presence: true
  validates :place,      presence: true
end
