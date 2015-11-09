class ChangeSleepsMinutesToHours < ActiveRecord::Migration
  def change
    rename_column(:sleeps, :minutes, :hours)
  end
end
