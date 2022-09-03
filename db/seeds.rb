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
List.destroy_all
User.destroy_all
Post.delete_all

puts "Populating the database, buckle up"

20.times do
  user = User.create!(
    email: Faker::Internet.email,
    password: Faker::Internet.password,
    username: Faker::Internet.user_name(separators: %w(. _))
  )
  puts "I'm #{user.email} and I love SheddyAdvice!"

  2.times do
    file = URI.open("https://www.familyhandyman.com/wp-content/uploads/2018/02/FH17JAU_580_54_001.jpg?fit=696,696")
    # upload_video = URI.open("https://res.cloudinary.com/dtgtbjkq6/video/upload/v1662220802/development/j1_we2dtb.mp4")
    post = Post.new(
      title: Faker::Hobby.activity,
      body: Faker::Lorem.paragraph(sentence_count: 2),

      category: ["In the Bathroom", "House Maintanance", "In the kitchen", "in the Garden"].sample,
      user_id: user.id
    )
    post.photo.attach(io: file, filename: "seed.png", content_type: "image/png")
    # post.video.attach(io: upload_video, filename: "video_seed.mp4", content_type: "video/mp4")
    post.save!

    5.times do
      feedback = Feedback.create!(
        comment: Faker::Lorem.paragraph(sentence_count: 1),
        rating: rand(1..5),
        user_id: user.id,
        post_id: post.id
      )
    end
  end
  puts "I've just shared some great tips how to be good at DIY #{user}"
end

puts "I'm done"
