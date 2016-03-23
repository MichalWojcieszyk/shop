class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :reviews
  has_many :products

  acts_as_voter
  mount_uploader :avatar, AvatarUploader

  validates_presence_of :firstname, :lastname, :email
end
