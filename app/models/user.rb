class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :cars, dependent: :destroy
  has_many :orders, dependent: :destroy
  has_many :orders, class_name: 'Order'
  has_many :requested_cars, through: :orders, source: :car
  has_one_attached :photo
end
