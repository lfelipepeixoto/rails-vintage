class Order < ApplicationRecord
  belongs_to :user
  belongs_to :car

  validates :sale_date, presence: true
end
