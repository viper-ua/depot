class StoreController < ApplicationController
  skip_before_action :authorize
  include CurrentCart
  before_action :set_cart
  def index
    if params[:set_locale]
      redirect_to store_index_url(locale: params[:set_locale])
    else
  	@products = Product.order(:title)
    # session[:counter] ||= 0
    # session[:counter] += 1
    # @message_to_user = nil
    # @message_to_user = "(Add something finally to cart instead of reloading page #{session[:counter]} times)" if session[:counter] > 5
    end
  end
end
