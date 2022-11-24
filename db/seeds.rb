# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

User.create(username: "admin", password: "password")
User.create(username: "Rex", password: "password")
User.create(username: "Abraham", password: "password")
User.create(username: "Chris", password: "password")
User.create(username: "Daniel", password: "password")

Car.create(model: "Ford", color: "Red", price: 300)
Car.create(model: "Honda", color: "Gray", price: 100)
Car.create(model: "Tesla", color: "Silver", price: 10000)
Car.create(model: "Macedes", color: "Black", price: 500)
Car.create(model: "Torrent", color: "White", price: 0)

Reservation.create(user_id: 1, car_id: 4, date: "2022-11-23", city: "New York")
Reservation.create(user_id: 2, car_id: 3, date: "2023-12-11", city: "Detriod")
Reservation.create(user_id: 3, car_id: 1, date: "2024-02-03", city: "Limgrave")
