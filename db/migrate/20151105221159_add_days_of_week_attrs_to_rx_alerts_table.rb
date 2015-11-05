class AddDaysOfWeekAttrsToRxAlertsTable < ActiveRecord::Migration
  def change
    add_column(:rx_alerts, :M, :boolean, default: false)
    add_column(:rx_alerts, :T, :boolean, default: false)
    add_column(:rx_alerts, :W, :boolean, default: false)
    add_column(:rx_alerts, :Th, :boolean, default: false)
    add_column(:rx_alerts, :F, :boolean, default: false)
    add_column(:rx_alerts, :S, :boolean, default: false)
    add_column(:rx_alerts, :Su, :boolean, default: false)
  end
end
