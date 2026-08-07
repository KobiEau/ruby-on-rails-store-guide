class User < ApplicationRecord
  has_secure_password # handles password encryption
  has_many :sessions, dependent: :destroy
  has_many :orders, dependent: :destroy
  validates :email_address, presence: true, uniqueness:true

  normalizes :email_address, with: ->(e) { e.strip.downcase }
end
