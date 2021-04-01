class Admin::DashboardController < ApplicationController
  http_basic_authenticate_with name: Rails.configuration.admin[:username], password:  Rails.configuration.admin[:userpassword]

  def show
    @number_of_categories = Category.count
    @number_of_products = Product.count
  end
end
