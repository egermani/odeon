json.array!(@votes) do |vote|
  json.extract! vote, :id, :user_id, :review_id, :sentiment
  json.url vote_url(vote, format: :json)
end
