require 'rails_helper'
require 'shoulda-matchers'

RSpec.describe Product, type: :model do

  before :each do
    @category = Category.new(
      :name => 'Computers'
    )
    @product = Product.new(
      :name => 'swing',
      :description => "wow",
      :category => @category,
      :quantity => 35,
      :price => 40,
    )
  end

  context 'Validations' do
    it ': product should be valid' do
      @product.valid?
    end

    it ':name should be present' do
      @product.name = nil
      @product.valid?
      expect(@product.errors.full_messages).to include("Name can't be blank")
    end

    it ': price should be present' do
      @product.price_cents = nil
      @product.valid?
      expect(@product.errors.full_messages).to include("Price can't be blank")
    end

    it ':quantity should be present' do
      @product.quantity = nil
      @product.valid?
      expect(@product.errors.full_messages).to include("Quantity can't be blank")
    end

    it ':category should be present' do
      @product.category = nil
      @product.valid?
      expect(@product.errors.full_messages).to include("Category can't be blank")
    end
  end
end
