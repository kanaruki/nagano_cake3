class Admins::OrderDetailsController < ApplicationController

  def update
    @detail = OrderDetail.find(params[:id])
    @detail.update(detail_params)
    order = @detail.order_id
    redirect_to admins_order_path(order)
  end
  
  private
    def detail_params
      params.require(:order_detail).permit(:making_status)
    end
end
