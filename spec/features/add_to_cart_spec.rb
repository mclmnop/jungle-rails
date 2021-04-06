# encoding: utf-8
require 'rails_helper'



RSpec.feature "Visitor can add to cart", type: :feature, js: true do

  #SETUP
  before :each do
    @category = Category.create! name: 'Apparel'

    10.times do |n|
      @category.products.create!(
        name:  Faker::Hipster.sentence(3),
        description: Faker::Hipster.paragraph(4),
        image: open_asset('apparel1.jpg'),
        quantity: 10,
        price: 64.99
      )
    end
  end

  scenario "They see all products" do
    visit root_path
    save_screenshot 'cart_test1_products_page.png'
    click_on('Add', match: :first)
    visit cart_path
    expect(page).to have_css '.items'
    #puts page.html
    #expect(page).to have_text(/Home/u)
    #page.has_content?(/My Cart/i)
    #expect(page).to have_content('Home')
    #expect(assert_text('Home')).to be true
    save_screenshot 'cart_test2_item_added.png'
  end
end
