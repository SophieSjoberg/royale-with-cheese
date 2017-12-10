class WebshopController < ApplicationController
  def show
    @products = Product.all
  end
end
