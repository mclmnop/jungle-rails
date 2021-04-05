require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do
    it "should save fine if all 4 categories are there" do
      @category = Category.new(name: "Cossins")
      @product = Product.new(name: "Peluche", price_cents: 9999, quantity: 99, :category => @category)
      @product.valid?
      puts"yo price"
      puts @product.errors.inspect
      saves_fine = @product.save
      expect(saves_fine).to be true
    end
    it "should have a name" do
        @category = Category.new(name: "Cossins")
        @product = Product.new(name: nil, price_cents: 9999, quantity: 99, category_id:4)
        @product.valid?
        expect(@product.errors[:name]).to include("can\'t be blank")
    end
    it "should have a price" do
        @category = Category.new(name: "Cossins")
        @product = Product.new(name: "doll", price_cents: nil, quantity: 4, category_id:4)
        @product.valid?
        # puts"yo price"
        # puts @product.errors.inspect
        expect(@product.errors[:price]).to include("is not a number")
    end
    it "should have a quantity" do
        @category = Category.new(name: "Cossins")
        @product = Product.new(name: "doll", price_cents: 5000, quantity: nil, category_id:4)
        @product.valid?
        expect(@product.errors[:quantity]).to include("can't be blank")
    end
    it "should have a category" do
        @category = Category.new(name: "Cossins")
        @product = Product.new(name: "doll", price_cents: 5000, quantity: 3, category_id: nil)
        @product.valid?
        expect(@product.errors[:category]).to include("can't be blank")
    end
  end
end
