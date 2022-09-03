require 'faker'
require 'json'
require 'open-uri'

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

puts "Cleaning database..."
User.destroy_all
Post.delete_all

puts "Populating the database, buckle up"

20.times do
  user = User.create!(
    email: Faker::Internet.email,
    password: Faker::Internet.password
  )
  puts "I'm #{user.email} and I love SheddyAdvice!"

  2.times do
    post = Post.create!(
      title: Faker::Hobby.activity,
      body: Faker::Lorem.paragraph(sentence_count: 2),
      # add categories to posts - hoeshold, garden, bathroom etc.
      image: Faker::LoremFlickr.image(size: "320x240", search_terms: ['hobby', 'diy'], match_all: true),
      user_id: user.id
    )
  end
  puts "I've just shared some great tips how to be good at DIY #{user}"
end

puts "I'm done"
