class AddQuantityToOrderDetails < ActiveRecord::Migration[5.2]
  def change
    add_column :order_details, :quantity, :integer
  end
end
