class Product < ApplicationRecord
  monetize :price_cents, numericality: true
  mount_uploader :image, ProductImageUploader

  belongs_to :category

  validates :name, presence: true
  validates :price, presence: true, format: { with: /\A\d+(?:\.\d{2})?\z/ }
  validates :quantity, presence: true
  validates :category, presence: true

  def soldout?
    quantity == 0
  end
end
