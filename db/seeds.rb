# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Package.create(name: 'Standard Car Wash', description: 'Basic Car Wash', price: 5)
Package.create(name: 'Standard Truck Wash', description: 'Basic Truck Wash', price: 10)
Addon.create(name: 'Muddy Bed', description: 'Muddy Truck Bed', price: 2)
WashException.create(name: 'Bed Down', description: 'Bed let down')
Discount.create(name: '2nd Time Visit', threshold: 2, equator: 'Equal', amount: 0.50)
StolenCar.create(license: '1111111')
