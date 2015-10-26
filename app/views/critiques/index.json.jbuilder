json.array!(@critiques) do |critique|
  json.extract! critique, :id, :user_id, :review_id, :keypoint_id, :title, :body
  json.url critique_url(critique, format: :json)
end
