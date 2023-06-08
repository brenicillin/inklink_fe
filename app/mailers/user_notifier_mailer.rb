class UserNotifierMailer < ApplicationMailer
  def send_artist_email(email, message)
    @email = email
    @message = message
    mail( :to => @email, 
    :subject => "Let's Link about Ink!" )
  end
end