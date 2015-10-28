require 'csv'

# table.headers => => ["Movie", "Release Year", "Rating", "# of Ratings", "Genre", "Awards", "Oscar Ws", "Oscar Ns", "Other Ws", "Other Ns", "Director", "Cast", "Description"]

5.times do
  User.create!(username: Faker::Internet.user_name, email: Faker::Internet.email, password: "password")
end

puts "Creating Movies"

CSV.foreach('db/movies.csv', headers: true) do |movie|
  Movie.create!(:title => movie["Movie"].strip,
                :release_date => ("1-1-"+movie["Release Year"]).to_date,
                :genres => movie["Genre"].split(", ").map {|g| Genre.find_or_create_by(name: g)},
                :director => movie["Director"],
                :synopsis => movie["Description"],
                :still_path => movie["imdb_id"])
end

keypoints = [{image_path: Faker::Avatar.image, name: "Acting"},
             {image_path: Faker::Avatar.image, name: "Cinematography"},
             {image_path: Faker::Avatar.image, name: "Score"},
             {image_path: Faker::Avatar.image, name: "Writing"},
             {image_path: Faker::Avatar.image, name: "Visual Effects"},
             {image_path: Faker::Avatar.image, name: "Misc."}]

puts "Creating Keypoints"

keypoints.each do |hash|
  Keypoint.create!(hash)
end

puts "Creating Reviews"

User.all.each do |user|
  user.reviews.create!(movie: Movie.all.sample, body: Faker::Lorem.paragraphs(3), thesis: Faker::Lorem.sentence, title: Faker::Hacker.ingverb, rating: Faker::Number.digit)
  user.reviews.create(movie: Movie.find(1), body: Faker::Lorem.paragraphs(3), thesis: Faker::Lorem.sentence, title: Faker::Hacker.ingverb, rating: Faker::Number.digit)
end

puts "Creating Votes"

User.all.each do |user|
  Review.all.each do |review|
    user.votes.create!(review: review, sentiment: Faker::Number.between(0, 3))
  end
end

puts "Creating Critiques"

User.all.each do |user|
  Review.all.each do |review|
    user.critiques.create!(review: review, keypoint_id: Keypoint.all.sample.id, title: Faker::Lorem.word, body: Faker::Lorem.sentence)
  end
end

puts "Creating Replies"

20.times do
  user = User.all.sample
  crit = Critique.all.sample
  user.replies.create(critique: crit, body: Faker::Lorem.sentence)
end

20.times do
  movie = Movie.first
  user = User.all.sample
  review = movie.reviews.sample
  crit = review.critiques.sample
  user.replies.create(critique: crit, body: Faker::Lorem.sentence)
end

puts "Creating Topics"

Review.all.each do |review|
  review.topics.create!(keypoint: Keypoint.all.sample)
end

Review.all.each do |review|
  review.topics.create!(keypoint: Keypoint.all.sample)
end