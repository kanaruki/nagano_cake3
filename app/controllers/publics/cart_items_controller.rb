class Publics::CartItemsController < ApplicationController
  def index
    @cart_item_all = current_customer.cart_items
    @price = 0
    #@cart_item = CartItem.find(params[:id])
   # @calculation = *1.1
  end

  def update
    @cart_item = CartItem.find(params[:id])
    @cart_item.update(cart_item_params)
    redirect_to cart_items_path
  end

  def destroy
    cart_item = CartItem.find(params[:id])
    cart_item.destroy
    redirect_to cart_items_path
  end

  def destroy_all
    current_customer.cart_items.destroy_all
    redirect_to cart_items_path
  end

  def create
    @cart_item = CartItem.new(cart_item_params)
    if @cart_item.save
      redirect_to cart_items_path
    else
      @item = Item.find(@cart_item.item_id)
      # @cart_item = CartItem.new
      render 'publics/items/show'
    end
  end
  
  private
  
  def cart_item_params
    params.require(:cart_item).permit(:item_id, :customer_id, :amount)
  end
  
  #def amount_params
    #params.repuire(:cart_item).permit(:amount)
  #end
end
