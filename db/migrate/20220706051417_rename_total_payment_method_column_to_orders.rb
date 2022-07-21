class RenameTotalPaymentMethodColumnToOrders < ActiveRecord::Migration[5.2]
  def change
    rename_column :orders,:total_payment_method,:total_payment
  end
end
