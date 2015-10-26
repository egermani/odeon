# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

30.times do
  User.create(username: Faker::Internet.user_name, email: Faker::Internet.email, password: "password")
end

50.times do
  Movie.create(title: Faker::App.name, synopsis: Faker::Lorem.sentences(2), release_date: Faker::Date.backward(700), director: Faker::App.author, still_path: Faker::Avatar.image)
end

keypoints = [{image_path: Faker::Avatar.             image, name: "Acting"},
             {image_path: Faker::Avatar.image, name: "Cinematography"},
             {image_path: Faker::Avatar.image, name: "Score"},
             {image_path: Faker::Avatar.image, name: "Writing"},
             {image_path: Faker::Avatar.image, name: "Visual Effects"}]

keypoints.each do |hash|
  Keypoint.create(hash)
end

User.all.each do |user|
  user.reviews.create(movie: Movie.sample, body: Faker::Lorem.paragraphs(3), thesis: Faker::Lorem.sentence, title: Faker::Hacker.ingverb, rating: Faker::Number.digit)
end