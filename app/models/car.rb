class Car < ApplicationRecord
  validates :model, presence: true
  validates :manufacturer, presence: true
  validates :year, presence: true
  validates :color, presence: true
  validates :price, presence: true
  validates :km, presence: true

  belongs_to :user
end
