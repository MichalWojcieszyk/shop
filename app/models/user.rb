class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :reviews
  has_many :products
  has_many :payments
  has_many :deposits

  acts_as_voter
  mount_uploader :avatar, AvatarUploader

  validates :firstname, :lastname, :email, :nickname, presence: true
end
