class Admin::DashboardController < ApplicationController

  http_basic_authenticate_with name: ENV['ADMIN_NAME'], password: ENV['ADMIN_PASS']

  def show
    @categories = Category.all
    @products = Product.all
  end
end
