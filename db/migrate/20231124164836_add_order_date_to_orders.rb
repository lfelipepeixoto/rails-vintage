class AddOrderDateToOrders < ActiveRecord::Migration[7.1]
  def change
    add_column :orders, :order_date, :datetime
  end
end
