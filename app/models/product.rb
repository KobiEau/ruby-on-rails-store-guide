class Product < ApplicationRecord
  belongs_to :category,optional: true
  has_many :order_items
  has_many :orders, through: :order_items
  validates :name, presence: true, length: {minimum: 2, maximum: 100}
  validates :price, presence:true, numericality:{greater_than:0}
end
