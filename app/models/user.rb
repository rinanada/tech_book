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
  devise :omniauthable, omniauth_providers: [:facebook, :twitter]
  

def self.from_omniauth(auth)
  where(auth.slice(:provider, :uid)).first_or_create do |user|
    user.email = auth.info.email
    user.password = Devise.friendly_token[0,20]
  end
end

def self.new_with_session(params, session)
  super.tap do |user|
    if data = session["devise.facebook_data"] && session["devise.facebook_data"]["extra"]["raw_info"]
        user.email = data["email"] if user.email.blank?
    end
  end
end


end
