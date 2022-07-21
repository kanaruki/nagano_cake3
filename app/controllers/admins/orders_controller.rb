class Admins::OrdersController < ApplicationController
  def update
    @order_status = Order.find(params[:id])
    @order_status.update(order_params)
    redirect_to admins_order_path(@order_status)
  end
  
  def show
    @order = Order.find(params[:id])
    @details = @order.order_details
    @shipping_cost = 800
  end
  
  def order_params
    params.require(:order).permit(:status)
  end
end
