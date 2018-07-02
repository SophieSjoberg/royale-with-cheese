class ShopController < ApplicationController
  def show
    @products = Product.all
  end
end
