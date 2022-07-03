class Publics::ItemsController < ApplicationController
  def index
    @itemall = Item.all
  end
  def show
    @item = Item.find(params[:id])
    @cart_item = CartItem.new
    #@cart_item.customer_id = current_customer.id
    #@cart_item.item_id = @item.id
  end
end
