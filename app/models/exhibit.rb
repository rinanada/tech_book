class Exhibit < ActiveRecord::Base
  belongs_to :user
  has_one :exhibit
end
