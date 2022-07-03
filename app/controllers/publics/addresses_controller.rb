class Publics::AddressesController < ApplicationController
  def index
    @address = Address.new
    @addresses = current_customer.addresses
  end
  
  def edit
    @address = Address.find(params[:id])
    
  end
  
  def create
    @address = Address.new(address_params)
    @address.customer_id=current_customer.id
    @address.save
    redirect_to addresses_path
  end
  
  def update
    @address = Address.find(params[:id])
    @address.update(address_params)
    redirect_to addresses_path
  end
  
  def destroy
    address = Address.find(params[:id])
    address.destroy
    redirect_to addresses_path
  end
  
  
  def customer_params
    params.require(:customer).permit(:first_name, :last_name, :first_name_kana, :last_name_kana, :postal_code, :address, :telephone_number, :email)
  end
  
  def address_params
    params.require(:address).permit(:name, :postal_code, :address,)
  end
end
