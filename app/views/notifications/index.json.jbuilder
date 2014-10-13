json.array!(@notifications) do |notification|
  json.extract! notification, :id, :api_id, :notification_type, :recipients
  json.url notification_url(notification, format: :json)
end
