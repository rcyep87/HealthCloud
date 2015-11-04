class AddNullFalseToSleepsTable < ActiveRecord::Migration
  def change
    change_column_null(:sleeps, :date_of_sleep, false)
  end
end
