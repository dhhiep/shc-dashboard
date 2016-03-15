json.array!(@centrals) do |central|
  json.extract! central, :id, :key, :value, :description
  json.url central_url(central, format: :json)
end
