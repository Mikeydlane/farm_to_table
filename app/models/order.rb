class Order < ApplicationRecord
  belongs_to :user, foreign_key: :seller_id
  has_many :order_products
  has_many :products, through: :order_products
end
