class Exhibit < ActiveRecord::Base
  belongs_to :user
  belongs_to :buying
end
