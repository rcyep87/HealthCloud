require 'twilio-ruby'

today = [:Su, :M, :T, :W, :Th, :F, :S][Time.now.wday]

rx_name         = nil
time            = nil
mobile          = nil
user_first_name = nil

@users.each do |user|
  user.rx_alerts.where(today => true).each do |alert|
    rx_name         = alert.prescription.name
    time            = alert.time_to_take.strftime
    mobile          = user.mobile_phone
    user_first_name = user.first_name
  end
end

five_min_before = (Time.now - 300).to_i
five_min_after  = (Time.now + 300).to_i

when time.to_i.overlaps?(five_min_before..five_min_after)
  send_text(mobile, user_first_name, rx_name)
end

when time.to_i <= five_min_after && time.to_i >= five_min_after
  send_text(mobile, user_first_name, rx_name)
end

  def send_txt(mobile, user_first_name, rx_name)
    account_sid = ENV["account_sid"]
    auth_token = ENV["auth_token"]

    @client = Twilio::REST::Client.new account_sid, auth_token

    @message = @client.messages.create(
      to: mobile,
      from: "+18323849264",
      body: "Hello #{user_first_name}! It is time to take your #{rx_name}."
    )

    redirect_to :back
  end





@users = User.all

@users.each do |user|
  user.rx_alerts.where(F: true).each do |alert|
    puts "#{alert.prescription.name}"
    puts "#{alert.time_to_take.strftime("%I:%M%P")}"
  end
end
