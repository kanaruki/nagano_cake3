class Order < ApplicationRecord
  has_many :order_details
  belongs_to :customer
  enum payment_method: { credit_card: 0, transfer: 1 }
  enum status: { waiting_for_deposit: 0, payment_confirmation: 1, in_production: 2, preparing_to_ship: 3, sent: 4 }
  
  validates :postal_code, presence: true
  validates :name, presence: true
  validates :address, presence: true
  validates :shipping_cost, presence: true
  validates :total_payment, presence: true
  validates :payment_method, presence: true
  validates :status, presence: true
  validates :customer_id, presence: true
end
