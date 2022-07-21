class Publics::OrdersController < ApplicationController
  
  def new
    @order = Order.new
    @customer_address = current_customer.address
    @customer_last_name = current_customer.last_name
    @customer_first_name = current_customer.first_name
  end
  
  def confirm
    #byebug
    @cart_item_all = current_customer.cart_items
    @order = Order.new(order_params)
    @order.shipping_cost = 800
    if params[:order][:select_address] == "0"
      #ご自身の住所を保存する処理
      @order.postal_code = current_customer.postal_code
      @order.address = current_customer.address
      @order.name = current_customer.last_name+current_customer.first_name
    elsif params[:order][:select_address] == "1"
      #登録済みの住所を保存する処理
      if params[:order][:address_id]
        order = Address.find(params[:order][:address_id])
        @order.postal_code = order.postal_code
        @order.address = order.address
        @order.name = order.name
      else
        flash.now[:danger] = "登録に失敗しました"
        render:new
      end
    elsif params[:order][:select_address] == "2"
      #新規登録住所
      # unless params[:order][:postal_code].blank?#<=本当は[order][:address, :postal_code, name]にしたい ＃追記blankが正しくてもすべて弾く
      # else
      #   render:new
      # end
      @order.postal_code = params[:order][:postal_code]
      @order.address = params[:order][:address]
      @order.name = params[:order][:name]
    else 
       @customer_last_name = current_customer.last_name
       @customer_first_name = current_customer.first_name
       flash.now[:danger] = "登録に失敗しました"
      render :new
    end
  end
  
  def top
  end
  
  def create
    #byebug
    @order = Order.new(order_params)
    @order.status = 0
    if @order.save
      @cart_items = current_customer.cart_items
      @cart_items.each do |cart_item|
        @order_detail = OrderDetail.new
        @order_detail.item_id = cart_item.item.id
        @order_detail.price = cart_item.item.with_tax_price
        @order_detail.amount = cart_item.amount
        @order_detail.order_id = @order.id
        @order_detail.save
      end
      @cart_items.destroy_all
      redirect_to orders_top_path
    else
      render:new
    end
  end
  
  def index
    @current_customer_orders = current_customer.orders.all
    #@order_details = order.order_details.new(3)
  end
  
  def show
    #byebug
    @order = Order.find(params[:id])
    @shipping_cost = 800
  end
  
  private
    def order_params
      params.require(:order).permit(:payment_method, :postal_code, :name, :address, :customer_id, :shipping_cost, :total_payment)
    end
end
