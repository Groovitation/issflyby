json.array!(@passes) do |pass|
  json.extract! pass, :id, :risetime, :duration, :user_id
  json.url pass_url(pass, format: :json)
end
