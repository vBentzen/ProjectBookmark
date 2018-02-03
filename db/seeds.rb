# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
1.times do
  User.create!(
      email: "test@testmail.com",
      password: "Flamingofir3",
      password_confirmation: "Flamingofir3",
      confirmed_at: Time.now
  )
end
users = User.all

# Create items
10.times do
  Topic.create!(
      user: users.sample,
      title: Faker::WorldOfWarcraft.hero,
      created_at: "2017-11-29  10:31:00",
  )
end

puts "Seed Finished"
puts "#{User.count} users created"
puts "#{Topic.count} topics created"