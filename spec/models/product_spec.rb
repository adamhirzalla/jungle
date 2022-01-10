require 'rails_helper'
require 'category'
require 'product'

RSpec.describe Product, type: :model do

  describe 'Validations' do
    before do 
      @category = Category.new(name: 'Test Category')
    end

    context 'when all required fields are given' do
      it 'should save the product successfully' do
      @product = @category.products.new(name: 'Test Product', price: 10, quantity: 20)
      @product.save!

      expect(@product.id).to be_present
      expect(@product.errors.count).to eq(0)
      expect(@product.name).to eq('Test Product')
      end
    end

    context 'when name field is missing' do
      it 'should not save the product and return an appropriate error' do
      @product = @category.products.new(name: nil, price: 10, quantity: 20)
      @product.save

      expect(@product.id).not_to be_present
      expect(@product.errors.full_messages).to include("Name can't be blank")
      end
    end

    context 'when price field is missing' do
      it 'should not save the product and return an appropriate error' do
      @product = @category.products.new(name: 'Test Product', price: nil, quantity: 20)
      @product.save

      expect(@product.id).not_to be_present
      expect(@product.errors.full_messages).to include("Price can't be blank")
      end
    end

    context 'when quantity field is missing' do
      it 'should not save the product and return an appropriate error' do
      @product = @category.products.new(name: 'Test Product', price: 10, quantity: nil)
      @product.save

      expect(@product.id).not_to be_present
      expect(@product.errors.full_messages).to include("Quantity can't be blank")
      end
    end

    context 'when category field is missing' do
      it 'should not save the product and return an appropriate error' do
      @product = Product.new(name: 'Test Product', price: 10, quantity: 20)
      @product.save

      expect(@product.id).not_to be_present
      expect(@product.errors.full_messages).to include("Category can't be blank")
      end
    end
  end

end
