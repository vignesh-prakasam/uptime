json.array!(@apis) do |api|
  json.extract! api, :id, :name, :url, :expected_response, :method_type
  json.url api_url(api, format: :json)
end
