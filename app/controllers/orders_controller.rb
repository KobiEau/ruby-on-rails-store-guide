class OrdersController < ApplicationController
  before_action :resume_session #ensure use is logged in

  def index
    @orders = Current.user.orders.includes(order_items: :product)
  end

  def show
    @order = Current.user.orders.find(params[:id])
  end

  def create
    @order = Current.user.orders.new(status: "pending")
    if @order.save
      product = Product.find(params[:product_id])
      @order.order_items.create!(
        product: product,
        quantity: params[:quantity] || 1,
        price: product.price
      )
      redirect_to @order, notice: "Order placed successfully"
    else
      redirect_to products_path, alert: "Something went wrong"
    end
  end
end
