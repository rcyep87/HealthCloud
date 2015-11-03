class AddNullFalseToEffectiveDateMedCoverage < ActiveRecord::Migration
  def change
    change_column_null(:med_coverages, :effective_date, false)
  end
end
