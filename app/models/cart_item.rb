class CartItem < ApplicationRecord
  belongs_to :item
  belongs_to :customer
  def subtotal
    item.with_tax_price * amount
  end
  validates :amount, presence: true,
                     length: { minimum: 1, maximum: 10 }
end
