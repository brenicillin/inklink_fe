class MailersController < ApplicationController
  def create
    ArtistSenderJob.perform_async(params[:mailers][:email], params[:mailers][:message])
    flash[:message] = "Email has been sent to #{params[:mailers][:email]} - get ready to be inked!"
    redirect_to "/sent"
  end

  def sent
  end
end