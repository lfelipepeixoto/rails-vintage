class UpdateUserAndCarAssociations < ActiveRecord::Migration[7.1]
  def change

    add_reference :orders, :user, foreign_key: true
    remove_reference :cars, :user, foreign_key: true
  end
end
