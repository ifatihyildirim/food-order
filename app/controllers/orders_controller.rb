class OrdersController < ApplicationController
  before_action :session_cart
  before_action :authenticate_user!
  before_action :order_find, only: [:show, :destroy]

  def index
    @orders = Order.where(:user_id => current_user)
    puts @orders
  end

  def show
  end

  def new
    @cart = session[:cart] ||= {}
    @order = current_user.orders.build
  end

  def create
    @order = current_user.orders.build(order_params)
    @order.number = SecureRandom.random_number(9999999999);

    if @order.save
      @cart.each do |product_id, quantity|
        @order_content = OrderContent.new
        @order_content.order_id = @order.id
        @order_content.product_id = product_id
        @order_content.count = quantity

        @order_content.save
      end
      
      session.delete(:cart)

      redirect_to orders_path
    else
      render "new"
    end
  end

  def destroy
    @order.destroy
    redirect_to orders_path
  end

  private
  def session_cart
    @cart = session[:cart] ||= {}
  end

  def order_params
    params.require(:order).permit(:note, :number)
  end

  def order_find
    @order = Order.find(params[:id])
  end

end
