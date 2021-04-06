require 'rails_helper'
require 'support/database_cleaner'


RSpec.feature "Visitor navigates to the product details page", type: :feature, js: true do

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

  scenario "They can click on one product" do
    visit root_path
    click_on('Details »', match: :first)
    expect(page).to have_css '.products-show'
    save_screenshot 'product_details_showpage.png'
  end
end