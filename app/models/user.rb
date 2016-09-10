class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
         # , :confirmable
  has_many :user_details
  has_many :profiles
  has_many :orders
  has_many :e_books, class_name: 'Book', :foreign_key => 'e_user_id'
  has_many :o_books, class_name: 'Book', :foreign_key => 'o_user_id'
  # mount_uploader :pro_img, UserImageUploader

  accepts_nested_attributes_for :user_details, allow_destroy: true
  validates_presence_of :lastname, :firstname, :postalcode, :callnumber, :place


end
