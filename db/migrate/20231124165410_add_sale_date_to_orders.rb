class AddSaleDateToOrders < ActiveRecord::Migration[7.1]
  def change
    add_column :orders, :sale_date, :datetime
  end
end
