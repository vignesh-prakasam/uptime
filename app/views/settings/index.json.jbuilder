json.array!(@settings) do |setting|
  json.extract! setting, :id, :api_id, :email_notification, :sms_notification, :email_ids, :phone_numbers
  json.url setting_url(setting, format: :json)
end
