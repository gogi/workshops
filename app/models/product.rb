class Product < ActiveRecord::Base
  belongs_to :category
  belongs_to :user
  has_many :reviews, dependent: :destroy

  validates :description, presence: true
  validates :price, presence: true, format: { with: /\A\d+(?:\.\d{0,2})?\z/ }
  validates :title, presence: true

  def average_rating
    return 0 if reviews.empty?
    all_rates = []
    reviews.each do |rate|
      all_rates << rate.rating
    end
    all_rates.sum.to_f / all_rates.count.to_f
  end
end
