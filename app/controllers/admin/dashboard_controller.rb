class Admin::DashboardController < ApplicationController
  def show
    @number_of_categories = Category.count
    @number_of_products = Product.count
  end
end
