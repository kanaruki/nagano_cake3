class Publics::CustomersController < ApplicationController
  def show
    @customer = current_customer
  end
  
  def edit
    @customer = current_customer
  end
  
  def update
    @customer = Customer.find(current_customer.id)
    @customer.update(customer_params)
    redirect_to customers_mypage_path( @customer)
  end

  def confirm
  end

  def withdrawal
    @customer_id = Customer.find(current_customer.id)
    @customer_id.is_active = false
    @customer_id.update
    redirect_to customers_confirm_path
  end

  def customer_params
    params.require(:customer).permit(:first_name, :last_name, :first_name_kana, :last_name_kana, :postal_code, :address, :telephone_number, :email)
  end

end

