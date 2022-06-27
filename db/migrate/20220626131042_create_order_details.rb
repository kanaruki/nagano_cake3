class CreateOrderDetails < ActiveRecord::Migration[5.2]
  def change
    create_table :order_details do |t|
      t.integer :item_idrails, null: false
      t.integer :order_id, null: false
      t.integer :price, null: false
      t.integer :amount, null: false
      t.string :making_status, null: false
      t.datetime :created_at, null: false
      t.datetime :updated_at, null: false

      t.timestamps
    end
  end
end
