json.array!(@spacepeople) do |spaceperson|
  json.extract! spaceperson, :id, :name, :craft, :spacecraft_id
  json.url spaceperson_url(spaceperson, format: :json)
end
