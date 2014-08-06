json.array!(@locations) do |location|
  json.extract! location, :id, :name, :body
  json.url location_url(location, format: :json)
end
