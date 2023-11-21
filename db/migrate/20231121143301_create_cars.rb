class CreateCars < ActiveRecord::Migration[7.1]
  def change
    create_table :cars do |t|
      t.references :user, null: false, foreign_key: true
      t.string :manufacturer
      t.string :model
      t.integer :year
      t.string :color
      t.float :price
      t.integer :km

      t.timestamps
    end
  end
end
