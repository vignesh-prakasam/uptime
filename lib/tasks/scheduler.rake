task :scheduler => :environment do
  puts "Checking API calls"
  puts "========================="

  # EMail notifications
  Api.all.each do |api|
    next if api.setting.email_notification.blank?
    a = api.execute_call
    Log.create(:api_id => api.id , :response => a.to_s , :status => api.check_status)
    if api.check_status.blank?
      p "#{api.name.upcase} ====> DOWN"
      recipients = api.setting.email_ids
      begin
        UserMailer.send_notification(recipients ,  "#{api.name} is down in PROD" ,   "#{api.name} is down in PROD. Error response #{api.logs.last.response}").deliver
        Notification.create(:api_id => api.id , :notification_type => "email" , :recipients => recipients)
      rescue => e
        p e.inspect
      end
    else
      p "#{api.name.upcase} ====> UP"
    end

  end

end