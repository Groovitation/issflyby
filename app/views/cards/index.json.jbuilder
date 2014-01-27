json.array!(@cards) do |card|
  json.extract! card, :id, :mirror_id, :pass_id
  json.url card_url(card, format: :json)
end
