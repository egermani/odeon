json.array!(@reviews) do |review|
  json.extract! review, :id, :user_id, :movie_id, :body, :thesis, :title, :rating
  json.url review_url(review, format: :json)
end
