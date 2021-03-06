json.array!(@med_coverages) do |med_coverage|
  json.extract! med_coverage, :id, :carrier, :plan_level, :network_type, :pcp_fee, :specialist_fee, :er_fee, :rx_brand_fee, :rx_generic_fee, :in_net_deduct_ind, :in_net_deduct_fam, :out_net_deduct_ind, :out_net_deduct_fam, :co_ins_percent, :out_of_pocket_max, :renewal_date, :user_id
  json.url med_coverage_url(med_coverage, format: :json)
end
