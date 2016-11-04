class CartsController < ApplicationController
  before_action :authenticate_user!
  before_action :session_cart, except: [:destroy]

  def index
  end

  def create
    product_id = params[:product_id]

    @cart[product_id] = (@cart[product_id] || 0) + 1

    redirect_to :cart
  end

  def eject
    product_id = params[:product_id]

    if @cart[product_id] == 1
      @cart.delete(product_id)
    else
      @cart[product_id] = (@cart[product_id] || 0) - 1
    end

    redirect_to :cart
  end

  def destroy
    session.delete(:cart)
    redirect_to :cart
  end

  private
  def session_cart
    @cart = session[:cart] ||= {}
  end

end
