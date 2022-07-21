class Publics::ItemsController < ApplicationController
  before_action :move_to_signed_in, except: [:index]
  def index
    @itemall = Item.all
  end
  def show
    @item = Item.find(params[:id])
    @cart_item = CartItem.new
    #@cart_item.customer_id = current_customer.id
    #@cart_item.item_id = @item.id
  end
  
  private
  
  def move_to_signed_in
    unless customer_signed_in?
      #サインインしていないユーザーはログインページが表示される
      redirect_to  '/customers/sign_up'
    end
  end
end
