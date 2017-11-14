require 'rails_helper'

RSpec.feature "Visitor clicks on product image", type: :feature, js: true do

  #setup
  before :each do
    @category = Category.create! name: 'Apparel'

    10.times do |n|
      @category.products.create!(
        name: Faker::Hipster.sentence(3),
        description: Faker::Hipster.paragraph(4),
        image: open_asset('apparel1.jpg'),
        quantity: 10,
        price: 64.99
      )
    end
  end

  scenario "They see product details" do
    visit root_path

    puts first(".product header a img")
    first(".product header a img").click
      expect(page).to have_css 'article.product-detail'
    save_screenshot

  end
end
