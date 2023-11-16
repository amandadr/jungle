=begin
Replace the text on the dashboard page with these general stats about the store:
Display a count of how many products are in the database
Display a count of how many categories are in the database
=end

class Admin::DashboardController < ApplicationController
  http_basic_authenticate_with name: ENV['ADMIN_USER'], password: ENV['ADMIN_PASSWORD']
  def show
    @product_count = Product.count
    @category_count = Category.count
  end
end