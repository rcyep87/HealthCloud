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

  today = [:Su, :M, :T, :W, :Th, :F, :S][Time.zone.now.wday]

  rx_name         = nil
  time            = nil
  mobile          = nil
  user_first_name = nil

  @users.each do |user|
    user.rx_alerts.where(today => true).each do |alert|
      next if alert.prescription.nil? || alert.time_to_take.nil?
      puts "DEBUG: [ALERT][ID:#{alert.id} #{alert.prescription.name} #{alert.time_to_take}] - [USER][ID:#{user.id} #{user.first_name}]"
      rx_name         = alert.prescription.name
      time            = alert.time_to_take
      mobile          = user.mobile_phone
      user_first_name = user.first_name

      five_min_before = (Time.zone.now - 5.minutes)
      five_min_after  = (Time.zone.now + 5.minutes)
      event_range = five_min_before..five_min_after

      if time.nil?
        adjusted_time = Time.zone.now.change({ hour: 00, min: 00 })
        if event_range.cover?(adjusted_time)
          puts "DEBUG: SENDING MESSAGE"
          send_txt(mobile, user_first_name, rx_name)
        end
      else
        adjusted_time = Time.zone.now.change({ hour: time.hour, min: time.min })
        if event_range.cover?(adjusted_time)
          puts "DEBUG: SENDING MESSAGE"
          send_txt(mobile, user_first_name, rx_name)
        end
      end

    end
  end
end
