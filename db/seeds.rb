# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.create(email: 'velisjoel@gmail.com', password: 123456, first_name: 'Joel', last_name:'Velis')
Car.create(year: 2012, brand: 'Audi', model: 'A6', odometer: 20000, transmission: 'manual', user_id: 1, price_per_day: 100)
Car.create(year: 2012, brand: 'Mercedes', model: 'A6', odometer: 20000, transmission: 'manual', user_id: 1, price_per_day: 100)
Car.create(year: 2012, brand: 'Porche', model: 'A6', odometer: 20000, transmission: 'manual', user_id: 1, price_per_day: 100)
Car.create(year: 2012, brand: 'Acura', model: 'A6', odometer: 20000, transmission: 'manual', user_id: 1, price_per_day: 100)
Car.create(year: 2012, brand: 'Tesla', model: 'A6', odometer: 20000, transmission: 'manual', user_id: 1, price_per_day: 100)
Car.create(year: 2012, brand: 'Lamborghini', model: 'A6', odometer: 20000, transmission: 'manual', user_id: 1, price_per_day: 100)
Car.create(year: 2012, brand: 'McLaren', model: 'A6', odometer: 20000, transmission: 'manual', user_id: 1, price_per_day: 100)
Car.create(year: 2012, brand: 'Ferrari', model: 'A6', odometer: 20000, transmission: 'manual', user_id: 1, price_per_day: 100)
Car.create(year: 2012, brand: 'Bugatti', model: 'A6', odometer: 20000, transmission: 'manual', user_id: 1, price_per_day: 100)
Car.create(year: 2012, brand: 'Infiniti', model: 'A6', odometer: 20000, transmission: 'manual', user_id: 1, price_per_day: 100)