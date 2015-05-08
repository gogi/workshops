class Product < ActiveRecord::Base
  belongs_to :category
  belongs_to :user
  has_many :reviews

  validates :description, presence: true
  validates :price, presence: true
  validates :title, presence: true

end
