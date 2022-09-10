require 'faker'
require 'json'
require 'open-uri'
require 'csv'

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

puts "Cleaning database..."
List.destroy_all
Feedback.destroy_all
User.destroy_all
Post.delete_all

puts "Populating the database, buckle up"

30.times do
  user = User.create!(
    email: Faker::Internet.email,
    password: Faker::Internet.password,
    username: Faker::Internet.user_name(separators: %w(. _))
  )
  puts "I'm #{user.username}, my id is #{user.id}, my email is #{user.email} and I love SheddyAdvice!"

    csv_text = File.read(Rails.root.join('lib', 'seeds', 'sheddyadvice_post_seeds.csv'))
    csv = CSV.parse(csv_text, :headers => true)
    csv.each do |row|
    # upload_video = URI.open("https://res.cloudinary.com/dtgtbjkq6/video/upload/v1662220802/development/j1_we2dtb.mp4")
    # post_photo = Unsplash::Photo.search(row['title'])
      post = Post.new(
      title: row['title'],
      # image: nil,
      body: row['body'],
      category: row['category'],
      user_id: User.all.sample.id
    )
    search_results = Unsplash::Photo.search(post.title)
    url = search_results.empty? ? "https://cdn.lifehack.org/wp-content/uploads/2013/01/Bundt-Bird-Feeder.jpg" : search_results.first.dig(:urls).regular
    filename = File.basename(URI.parse(url).path)
    file = URI.open(url)
    post.image.attach(io: file, filename: filename, content_type: "image/png")
    # come back later to finish the video seed
    # post.video.attach(io: upload_video, filename: "video_seed.mp4", content_type: "video/mp4")
    post.save!
  end
  puts "I've just shared some great tips how to be good at DIY #{user}"
end

5.times do
  Feedback.create!(
    comment: Faker::Lorem.paragraph(sentence_count: 1),
    rating: rand(1..5),
    user_id: User.all.sample.id,
    post_id: Post.all.sample.id
  )
end

puts "I'm done"
