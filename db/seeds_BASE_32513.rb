require 'csv'

# table.headers => => ["Movie", "Release Year", "Rating", "# of Ratings", "Genre", "Awards", "Oscar Ws", "Oscar Ns", "Other Ws", "Other Ns", "Director", "Cast", "Description"]

30.times do
  User.create(username: Faker::Internet.user_name, email: Faker::Internet.email, password: "password")
end

CSV.foreach('db/movies.csv', headers: true) do |movie|
  Movie.create!(:title => movie["Movie"],
                :release_date => ("1-1-"+movie["Release Year"]).to_date,
                :genres => movie["Genre"].split(", ").map {|g| Genre.find_or_create_by(name: g)},
                :director => movie["Director"],
                :synopsis => movie["Description"],
                :still_path => Faker::Avatar.image)
end

keypoints = [{image_path: Faker::Avatar.image, name: "Acting"},
             {image_path: Faker::Avatar.image, name: "Cinematography"},
             {image_path: Faker::Avatar.image, name: "Score"},
             {image_path: Faker::Avatar.image, name: "Writing"},
             {image_path: Faker::Avatar.image, name: "Visual Effects"}]

keypoints.each do |hash|
  Keypoint.create(hash)
end

User.all.each do |user|
  user.reviews.create(movie: Movie.all.sample, body: Faker::Lorem.paragraphs(3), thesis: Faker::Lorem.sentence, title: Faker::Hacker.ingverb, rating: Faker::Number.digit)
  user.reviews.create(movie: Movie.find(1), body: Faker::Lorem.paragraphs(3), thesis: Faker::Lorem.sentence, title: Faker::Hacker.ingverb, rating: Faker::Number.digit)
end

User.all.each do |user|
  Review.all.each do |review|
    user.votes.create(review: review, sentiment: Faker::Number.between(0, 3))
  end
end

User.all.each do |user|
  Review.all.each do |review|
    user.critiques.create(review: review, keypoint_id: Keypoint.all.sample.id, title: Faker::Lorem.word, body: Faker::Lorem.sentence)
  end
end

User.all.each do |user|
  Critique.all.each do |crit|
    user.replies.create(critique: crit, body: Faker::Lorem.sentence)
  end
end

Review.all.each do |review|
  review.topics.create(keypoint: Keypoint.all.sample)
end
