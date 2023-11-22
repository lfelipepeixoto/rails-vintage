# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
# require 'faker'
User.destroy_all
Car.destroy_all


user = User.create(email: 'admin@admin.com', password: '123123')

Car.create(manufacturer: 'Chevrolet', model: 'D-20', year: 1995, km: 0, price: 20_500, color: 'Vinho', user: user)
Car.create(manufacturer: 'Volksvagem', model: 'Fusca', year: 1965, km: 0, price: 26_000, color: 'Preto', user: user)
Car.create(manufacturer: 'Ford', model: 'F1000', year: 2002, color: 'Vinho', price: 23_000, km: 12_334, user: user)

# 10.times do
#   Car.create(
#     model: Faker::Vehicle.make,
#     year: Faker::Vehicle.year,
#     price: Faker::Commerce.price(range: 1000..50000.0, as_string: true)
#   )
# end
