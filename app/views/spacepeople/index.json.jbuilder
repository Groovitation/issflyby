json.array!(@spacepeople) do |spaceperson|
  json.extract! spaceperson, :id, :name, :craft, :Spacecraft_id
  json.url spaceperson_url(spaceperson, format: :json)
end
