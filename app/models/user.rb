class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :authentication_keys => [:username]
         # , :confirmable
  has_many :exibits
  has_many :buyings
  has_many :addresses
  validates :username, :password, presence: true

  validates_uniqueness_of :username
  validates_presence_of :username
  validates :username, presence: true
  validates :password, presence: true
  validates :email, presence: true
  # validates :username, presence: true

    #usernameを利用してログインするようにオーバーライド
  def self.find_first_by_auth_conditions(warden_conditions)
    conditions = warden_conditions.dup
    if login = conditions.delete(:login)
      #認証の条件式を変更する
      where(conditions).where(["username = :value", { :value => username }]).first
    else
      where(conditions).first
    end
  end

  def email_required?
    false
  end

  def email_changed?
    false
  end

end
