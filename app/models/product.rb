class Product < ActiveRecord::Base
  belongs_to :category
  belongs_to :user
  has_many :reviews, dependent: :destroy

  acts_as_votable

  validates_presence_of :title, :description, :price
  
  validates_format_of :price, with: /^\d+\.?\d{0,2}$/, multiline: true
end
