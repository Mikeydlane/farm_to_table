class Invoice < ApplicationRecord
  belongs_to :user
  has_many :invoice_orders
  has_many :orders, through: :invoice_orders
  has_many :products, through: :orders
end
