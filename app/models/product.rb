class Product < ApplicationRecord
  has_many :order_contents
  belongs_to :order
end
