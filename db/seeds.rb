# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
puts "destroy destinations"
Destination.destroy_all

puts "destroy blogger"
Blogger.destroy_all

puts "destroy posts"
Post.destroy_all

puts "create destination"
30.times do 
  Destination.create({
    name: Faker::GameOfThrones.city,
    country: Faker::Address.country
  })
end

puts "create blogger"
10.times do
  blogger = Blogger.create({
    name: Faker::Name.name,
    bio: Faker::Hipster.paragraph,
    age: (13..100).to_a.sample
  })

  (2..6).to_a.sample.times do 
    Post.create({
      title: Faker::Hipster.sentence(3),
      content: Faker::Hipster.paragraphs(4),
      likes: rand(0..10),
      blogger: blogger,
      destination: Destination.all.sample
    })
  end
end
