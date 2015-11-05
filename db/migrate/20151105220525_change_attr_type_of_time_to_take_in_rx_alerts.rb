class ChangeAttrTypeOfTimeToTakeInRxAlerts < ActiveRecord::Migration
  def change
    change_column(:rx_alerts, :time_to_take, :time)
  end
end
