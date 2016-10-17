class Order < ActiveRecord::Base
  belongs_to :ordering, polymorphic: true
end
