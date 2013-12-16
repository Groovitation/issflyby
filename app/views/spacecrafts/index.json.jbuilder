json.array!(@spacecrafts) do |spacecraft|
  json.extract! spacecraft, :id, :name, :crew, :lat, :long
  json.url spacecraft_url(spacecraft, format: :json)
end
