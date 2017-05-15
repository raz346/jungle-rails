require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do
    before(:each) do
      @product = Product.new
      @product.name = 'mug'
      @product.price_cents = 5
      @product.quantity = 20
      
      @category = Category.new
      @category.name = 'stuff'
      @product.category = @category
    end
    
    it ("check if product is created ") do
      expect(@product).to be_valid
    end

    it ("validate product name ") do
      @product.name = nil
      @product.save
      expect(@product.errors.full_messages).to include ("Name can't be blank")
    end

    it ("validate product price ") do
      @product.price_cents = nil
      @product.save
      expect(@product.errors.full_messages).to include ("Price can't be blank")
    end

    it ("validates product quantity") do
      @product.quantity = nil
      @product.save
      expect(@product.errors.full_messages).to include ("Quantity can't be blank")
    end

    it ("valdiate product category") do
      @product.category = nil
      @product.save
      expect(@product.errors.full_messages).to include("Category can't be blank")
    end
  end
end
