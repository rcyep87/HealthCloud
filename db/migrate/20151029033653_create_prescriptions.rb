class CreatePrescriptions < ActiveRecord::Migration
  def change
    create_table :prescriptions do |t|
      t.string :name,             null: false
      t.integer :dosage,          null: false
      t.string :frequency,        null: false
      t.boolean :brand,           null: false
      t.date :date_prescribed,    null: false
      t.date :refill_till
      t.string :rx_notes
      t.belongs_to :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
