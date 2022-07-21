class Admins::HomesController < ApplicationController
  def top
    @order_all = Order.all
    
  end
end
