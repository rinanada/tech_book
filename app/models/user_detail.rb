class UserDetail < ActiveRecord::Base
  belongs_to :user
  validates :lastname,  presence: true
  validates :firstname,     presence: true
  validates :postalcode,   presence: true
  validates :place,      presence: true
end
