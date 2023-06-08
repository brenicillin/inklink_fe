require 'rails_helper'

RSpec.describe ArtistSenderJob, type: :job do
  before(:each) do
    @email = "bob@tattoo.com"
    @message = "I love your style!"
  end

  it "generates an email to artist" do
    Sidekiq::Job.clear_all

    ArtistSenderJob.new.perform(@email, @message)

    expect {
      ArtistSenderJob.perform_async(@email, @message)
    }.to change(ArtistSenderJob.jobs, :size).by(1)
  end

  it "clears queue" do
    email_1 = "cat@style.com"
    message_1 = "Cat tattoos are RAD"

    ArtistSenderJob.new.perform(@email, @message)
    ArtistSenderJob.new.perform(email_1, message_1)

    expect {
      ArtistSenderJob.perform_async(@email, @message)
      ArtistSenderJob.perform_async(email_1, message_1)
    }.to change(ArtistSenderJob.jobs, :size).by(2)

    ArtistSenderJob.drain

    expect(ArtistSenderJob.jobs.size).to eq(0)
  end
end
