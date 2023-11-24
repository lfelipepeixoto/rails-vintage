class Car < ApplicationRecord
  validates :model, presence: true
  validates :manufacturer, presence: true
  validates :year, presence: true
  validates :color, presence: true
  validates :price, presence: true
  validates :km, presence: true

  belongs_to :user
  has_one :sale, dependent: :destroy

  has_one_attached :photo

  include PgSearch::Model
  pg_search_scope :search_car,
  against: [ :model, :manufacturer ],
  using: {
    tsearch: { prefix: true } # <-- now `superman batm` will return something!
  }
end
