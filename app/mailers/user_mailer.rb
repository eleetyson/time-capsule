class UserMailer < ApplicationMailer
  def scheduled_email(message)
    @message = message
    mail(to: @message.email_address, subject: '👋')
  end
end
