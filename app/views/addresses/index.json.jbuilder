json.array!(@addresses) do |address|
  json.extract! address, :id, :user_id, :state, :city, :street, :zip
  json.url address_url(address, format: :json)
end
