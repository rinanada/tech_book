class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
         # , :confirmable
  has_many :user_details
  has_many :profiles
  has_many :orders
  has_many :books, through: :orders

  accepts_nested_attributes_for :user_details, allow_destroy: true


end
