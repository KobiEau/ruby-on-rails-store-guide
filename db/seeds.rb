# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

# Clear existing data to avoid duplicates on re-run
OrderItem.destroy_all
Order.destroy_all
Category.destroy_all

# Categories
electronics = Category.create!(name: "Electronics")
clothing = Category.create!(name: "Clothing")
footwear = Category.create!(name: "Footwear")

# Products
Product.create!(name: "iPhone 15", price: 999.99, category: electronics)
Product.create!(name: "Samsung TV", price: 499.99, category: electronics)
Product.create!(name: "AirPods Pro", price: 249.99, category: electronics)
Product.create!(name: "Nike T-Shirt", price: 29.99, category: clothing)
Product.create!(name: "Levi Jeans", price: 59.99, category: clothing)
Product.create!(name: "Nike Air Max", price: 129.99, category: footwear)
Product.create!(name: "Adidas Slides", price: 39.99, category: footwear)