class User < ApplicationRecord
  has_secure_password
  has_many :orders
  has_many :products
  has_many :invoices
end
