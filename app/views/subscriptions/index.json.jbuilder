json.array!(@subscriptions) do |subscription|
  json.extract! subscription, :id, :spacecraft_id, :user_id
  json.url subscription_url(subscription, format: :json)
end
