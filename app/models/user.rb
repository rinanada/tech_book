class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :omniauthable
         # , :confirmable
  has_many :user_details
  has_many :profiles
  has_many :orders
  has_many :e_books, class_name: 'Book', :foreign_key => 'e_user_id'
  has_many :o_books, class_name: 'Book', :foreign_key => 'o_user_id'
  # mount_uploader :pro_img, UserImageUploader

  accepts_nested_attributes_for :user_details, allow_destroy: true
  validates_presence_of :lastname, :firstname, :postalcode, :callnumber, :place

  def self.find_for_oauth(auth)
    user = User.where(uid: auth.uid, provider: auth.provider).first

    unless user
      user = User.create(
        uid:      auth.uid,
        provider: auth.provider,
        email:    User.dummy_email(auth),
        password: Devise.friendly_token[0, 20]
      )
    end

    user
  end

  private

  def self.dummy_email(auth)
    "#{auth.uid}-#{auth.provider}@example.com"
  end


end
