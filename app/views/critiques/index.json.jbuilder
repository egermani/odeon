json.critiques(@critiques) do |critique|
  json.extract! critique, :id, :critiquer, :review_id, :keypoint, :title, :body
  json.url critique_url(critique, format: :json)
end
