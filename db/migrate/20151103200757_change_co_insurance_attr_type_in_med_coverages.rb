class ChangeCoInsuranceAttrTypeInMedCoverages < ActiveRecord::Migration
  def change
    change_column(:med_coverages, :co_ins_percent, :string)
  end
end
