class UserMailer < ActionMailer::Base
  default from: 'vprakasam@anpi.com'


  def send_notification(to, subject , status)
    p "attempting delivery........"
    @status = status
    mail to: to, subject: subject
  end


end
