class ArtistSenderJob
  include Sidekiq::Job

  def perform(email, message)
    UserNotifierMailer.send_artist_email(email, message).deliver_now
  end
end
