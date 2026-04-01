class Product < ApplicationRecord
  validates :name, presence: true, length: {minimum: 2, maximum: 100}
  validates :price, presence:true, numericality:{greater_than:0}
end
