class AddDateOfSleepAttrToSleepsTable < ActiveRecord::Migration
  def change
    add_column(:sleeps, :date_of_sleep, :date)
  end
end
