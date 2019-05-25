# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Car.create(year: 2012, brand: 'Audi', model: 'A6', odometer: 20000, transmission: 'manual', user_id: 1, price_per_day: 100, address: '4923  Hart Ridge Road')
Car.create(year: 2012, brand: 'Mercedes', model: 'A6', odometer: 20000, transmission: 'manual', user_id: 2, price_per_day: 100, address: '601  Hilltop Haven Drive')
Car.create(year: 2012, brand: 'Porche', model: 'A6', odometer: 20000, transmission: 'manual', user_id: 1, price_per_day: 100, address: '3890  Willow Greene Drive')
Car.create(year: 2012, brand: 'Acura', model: 'A6', odometer: 20000, transmission: 'manual', user_id: 2, price_per_day: 100, address: '4975  Fowler Avenue')
Car.create(year: 2012, brand: 'Tesla', model: 'A6', odometer: 20000, transmission: 'manual', user_id: 1, price_per_day: 100, address: '1783  Franklin Avenue')
Car.create(year: 2012, brand: 'Lamborghini', model: 'A6', odometer: 20000, transmission: 'manual', user_id: 2, price_per_day: 100, address: '2745  Kenwood Place')
Car.create(year: 2012, brand: 'McLaren', model: 'A6', odometer: 20000, transmission: 'manual', user_id: 3, price_per_day: 100, address: '2307  Stratford Court
  ')
Spree::Core::Engine.load_seed if defined?(Spree::Core)
Spree::Auth::Engine.load_seed if defined?(Spree::Auth)
