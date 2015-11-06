require 'twilio-ruby'

desc "Send text message reminders to all scheduled users"
task :send_reminder => :environment do

  def send_txt(mobile, user_first_name, rx_name)
    account_sid = ENV["account_sid"]
    auth_token = ENV["auth_token"]

    @client = Twilio::REST::Client.new account_sid, auth_token

    @message = @client.messages.create(
      to: mobile,
      from: "+18323849264",
      body: "Hello #{user_first_name}! It is time to take your #{rx_name}."
    )
  end

  @users = User.all

  today = [:Su, :M, :T, :W, :Th, :F, :S][Time.now.wday]

  rx_name         = nil
  time            = nil
  mobile          = nil
  user_first_name = nil

  @users.each do |user|
    user.rx_alerts.where(today => true).each do |alert|
      puts "DEBUG: [ALERT][ID:#{alert.id} #{alert.prescription.name} #{alert.time_to_take}] - [USER][ID:#{user.id} #{user.first_name}]"
      rx_name         = alert.prescription.name
      time            = alert.time_to_take
      mobile          = user.mobile_phone
      user_first_name = user.first_name
    end
  end

  five_min_before = (Time.now - 300)
  five_min_after  = (Time.now + 300)
  event_range = five_min_before..five_min_after
  adjusted_time = DateTime.now.change({ hour: time.hour, min: time.min })

  if event_range.cover?(adjusted_time)
    puts "DEBUG: SENDING MESSAGE"
    send_txt(mobile, user_first_name, rx_name)
  end
end
