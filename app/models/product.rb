class Product < ActiveRecord::Base
  belongs_to :category
  belongs_to :user
  has_many :reviews, dependent: :destroy
  has_many :payments

  acts_as_votable
  mount_uploader :avatar, AvatarUploader

  validates :title, :description, :price, :on_stock, presence: true
  
  validates :price, format: { :with => /\A\d+(?:\.\d{0,2})?\z/ }
  validates :price, numericality: { greater_than: 0, less_than: 1000000 }
end
