class Review < ActiveRecord::Base
  belongs_to :restaurant
  validates :rating, numericality: { greater_than: -1, less_than: 6, allow_nil: false }
  validates :content, presence: true
  validates :restaurant_id, presence: true
  # validates :rating, presence: true
end
