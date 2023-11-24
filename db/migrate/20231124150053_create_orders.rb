class CreateOrders < ActiveRecord::Migration[6.0]
  def change
    create_table :orders do |t|
      t.references :user, null: false, foreign_key: true
      t.references :car, null: false, foreign_key: true
      t.datetime :order_date
      t.timestamps
    end

    add_index :orders, [:user_id, :car_id], unique: true
  end
end
