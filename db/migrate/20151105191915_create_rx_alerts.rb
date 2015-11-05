class CreateRxAlerts < ActiveRecord::Migration
  def change
    create_table :rx_alerts do |t|
      t.datetime :time_to_take, null: false
      t.belongs_to :user, index: true, foreign_key: true
      t.belongs_to :prescription, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
