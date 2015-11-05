require 'twilio-ruby'

class TwilioController < ApplicationController
  include Webhookable

  after_filter :set_header

  skip_before_action :verify_authenticity_token

  def send_txt
    account_sid = ENV["account_sid"]
    auth_token = ENV["auth_token"]

    @client = Twilio::REST::Client.new account_sid, auth_token

    @message = @client.messages.create(
      to: "+18324884746",
      from: "+18323849264",
      body: "Hello Ryan!"
    )

    redirect_to :back
  end

end
