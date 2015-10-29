class CreateVisits < ActiveRecord::Migration
  def change
    create_table :visits do |t|
      t.string :physician_first,   null: false
      t.string :physician_last,    null: false
      t.date :dos,                 null: false
      t.string :reason_for_visit,  null: false
      t.string :diagnosis,         null: false
      t.string :dr_notes
      t.belongs_to :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
