json.array!(@groups) do |group|
  json.extract! group, :id, :organization_id, :name
  json.url group_url(group, format: :json)
end
