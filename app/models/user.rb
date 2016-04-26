class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :reviews, dependent: :destroy
  has_many :products, dependent: :destroy
  has_many :payments, dependent: :destroy
  has_many :deposits, dependent: :destroy

  acts_as_voter
  mount_uploader :avatar, AvatarUploader

  validates :firstname, :lastname, :email, :nickname, presence: true
  validates :cash_amount, numericality: { greater_than_or_equal_to: 0 }
end
