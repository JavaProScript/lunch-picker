# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.destroy_all
puts "Creating Bruce..."
User.create(
  name: 'Bruce',
  email: 'b@t.man',
  password: '123456'
)
puts "Bruce created!"

puts "Clearing restaurants..."
Restaurant.destroy_all
puts "Clear!"
i = 1
20.times do 
  restaurant = Restaurant.create(
    name: Faker::Restaurant.name,
    style: %w[Italian Lebanese Japanese Belgian French Chinese Undefined].sample,
    address: Faker::Address.full_address,
    price: (15..50).to_a.sample.to_f
  )
  puts "#{i}. #{restaurant.name} successfully created!"
  i += 1
end
puts "Seeding complete!"
