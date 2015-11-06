

when Time.now == "#{Time.now.hour} + #{Time.now.min}"

when [:Su, :M, :T, :W, :Th, :F, :S][Time.now.wday] ==

Precription.rx_alerts.each do |rx|
  rx.time_to_take
end
