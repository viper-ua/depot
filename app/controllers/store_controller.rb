class StoreController < ApplicationController
  def index
  	@products = Product.order(:title)
    session[:counter] ||= 0
    session[:counter] += 1
    @message_to_user = nil
    @message_to_user = "(Add something finally to cart instead of reloading page #{session[:counter]} times)" if session[:counter] > 5
  end
end
