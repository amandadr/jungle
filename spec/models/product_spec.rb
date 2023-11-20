require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do
    it 'should save successfully when all four fields are set' do
      @category = Category.new(name: 'Test')
      @product = Product.new(name: 'Test', price: 100, quantity: 10, category: @category)
      @product.save!
      expect(@product).to be_present
    end

    it 'should not save when name is not set' do
      @category = Category.new(name: 'Test')
      @product = Product.new(name: nil, price: 100, quantity: 10, category: @category)
      @product.save
      expect(@product.errors.full_messages).to include("Name can't be blank")
    end

    it 'should not save when price is not set' do
      @category = Category.new(name: 'Test')
      @product = Product.new(name: 'Test', price: '', quantity: 10, category: @category)
      @product.save
      expect(@product.errors.full_messages).to include("Price is not a number")
    end

    it 'should not save when quantity is not set' do
      @category = Category.new(name: 'Test')
      @product = Product.new(name: 'Test', price: 100, quantity: nil, category: @category)
      @product.save
      expect(@product.errors.full_messages).to include("Quantity can't be blank")
    end

    it 'should not save when category is not set' do
      @category = Category.new(name: 'Test')
      @product = Product.new(name: 'Test', price: 100, quantity: 10, category: nil)
      @product.save
      expect(@product.errors.full_messages).to include("Category can't be blank")
    end
  end
end
