class ShopController < ApplicationController
  def show
    binding.pry
    @products = Product.all
  end
end
