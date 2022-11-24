# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

User.create(username: "admin", password_digest: "password", first_name: "John", last_name: "doe", dob: "2000-03-23" )
User.create(username: "Rex", password_digest: "password", first_name: "Rex", last_name: "Silver", dob: "2010-03-23")
User.create(username: "Abraham", password_digest: "password", first_name: "Abraham", last_name: "Smith", dob: "2003-06-20")

Car.create(model: "Ford", color: "Red", price: 300, description: "made in Japan, on the 13th of october 2022, has a maximum speed of 233km/h", release_date: "2022-03-23" )
Car.create(model: "Honda", color: "Gray", price: 100, description: "made in China, on the 13th of october 2022, has a maximum speed of 233km/h", release_date: "2022-03-23")
Car.create(model: "Tesla", color: "Silver", price: 10000, description: "made in USA, on the 15th of october 2022, has a maximum speed of 233km/h", release_date: "2022-03-23")


Reservation.create(user_id: 1, car_id: 4, date: "2022-11-23", city: "New York")
Reservation.create(user_id: 2, car_id: 3, date: "2023-12-11", city: "Detriod")
Reservation.create(user_id: 3, car_id: 1, date: "2024-02-03", city: "Limgrave")
