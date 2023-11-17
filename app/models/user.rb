class User < ApplicationRecord
  has_secure_password

  validates :firstName, :surname, :email, :password, presence: true
  validates :email, uniqueness: true
end
