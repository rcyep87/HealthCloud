class AddEffectiveDateToMedCoverage < ActiveRecord::Migration
  def change
    add_column(:med_coverages, :effective_date, :date, null: :false)
  end
end
