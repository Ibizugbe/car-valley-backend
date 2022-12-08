# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
User.create(username: "admin", password: "password", first_name: "John", last_name: "doe", dob: "2000-03-23" )
User.create(username: "Rex", password: "password", first_name: "Rex", last_name: "Soul", dob: "2010-03-23")
User.create(username: "Abraham", password: "password", first_name: "Abraham", last_name: "Smith", dob: "2003-06-20")
User.create(username: "Chrispaix", password: "123456789", first_name: "kaze", last_name: "Sauveur", dob: "2003-06-20")
User.create(username: "Daniel", password: "123456789", first_name: "Urimubenshi", last_name: "benshi", dob: "2003-06-20")

Car.create(model: "Mahindra", color: "Green", price: 300, description: "made in Japan, on the 13th of october 2022, has a maximum speed of 233km/h", release_date: "2022-03-23", image: "https://i.postimg.cc/YCGv7PmX/Mahindra-Scorpio-N-300620221053-removebg-preview.png")
Car.create(model: "BWM x-12", color: "Blue", price: 10000, description: "made in Germany, on the 16th of september 2022, has a maximum speed of 233km/h", release_date: "2022-03-23", image: "https://i.postimg.cc/XJ2kLp2L/BMW-Z4-Roadster-Right-Front-Three-Quarter-153914-removebg-preview.png")
Car.create(model: "Chevrolet", color: "Red", price: 300, description: "made in USA, on the 16th of september 2022, has a maximum speed of 233km/h", release_date: "2022-03-23", image: "https://i.postimg.cc/k5QM3SKJ/car-photo-311956-removebg-preview.png")
Car.create(model: "Aventador", color: "Yellow", price: 100, description: "made in Italia, on the 02 of october 2022, has a maximum speed of 233km/h", release_date: "2022-03-23", image: "https://i.postimg.cc/XvYWhPj8/lambo-removebg-preview.png")
Car.create(model: "Ferrari 12", color: "Red", price: 10000, description: "made in Italia, on the 15th of october 2022, has a maximum speed of 233km/h", release_date: "2022-03-23", image: "https://i.postimg.cc/fL7v98dG/images-removebg-preview.png")
Car.create(model: "Rolls", color: "White", price: 10000, description: "made in USA, on the 15th of october 2022, has a maximum speed of 233km/h", release_date: "2022-03-23", image: "https://i.postimg.cc/1z78YwQ8/rollc-removebg-preview.png")

Reservation.create(user_id: 1, car_id: 4, date: "2022-11-23", city: "New York")
Reservation.create(user_id: 2, car_id: 3, date: "2023-12-11", city: "Detriod")
Reservation.create(user_id: 3, car_id: 1, date: "2024-02-03", city: "Limgrave")
