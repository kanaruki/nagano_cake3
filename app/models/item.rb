class Item < ApplicationRecord
  attachment :image
  belongs_to :genre
  has_many :cart_items
  has_many :order_details
  def with_tax_price
    (price * 1.1).floor
  end
  validates :name, presence: true
  validates :image, presence: true
  validates :introduction, presence: true
  validates :price,numericality: { only_integer: true }
  validates :genre_id, presence: true
  # validates :is_active, presence: true
end
