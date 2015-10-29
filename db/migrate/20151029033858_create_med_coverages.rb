class CreateMedCoverages < ActiveRecord::Migration
  def change
    create_table :med_coverages do |t|
      t.string :carrier,                null: false
      t.string :plan_level,             null: false
      t.string :network_type,           null: false
      t.string :memberid,               null: false
      t.integer :pcp_fee,               null: false
      t.integer :specialist_fee,        null: false
      t.integer :er_fee,                null: false
      t.integer :rx_brand_fee
      t.integer :rx_generic_fee
      t.integer :in_net_deduct_ind
      t.integer :in_net_deduct_fam
      t.integer :out_net_deduct_ind
      t.integer :out_net_deduct_fam
      t.integer :co_ins_percent
      t.integer :out_of_pocket_max,     null: false
      t.date :renewal_date,             null: false
      t.belongs_to :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
