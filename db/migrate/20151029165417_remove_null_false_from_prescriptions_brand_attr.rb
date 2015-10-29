class RemoveNullFalseFromPrescriptionsBrandAttr < ActiveRecord::Migration
  def change
    change_column_null(:prescriptions, :brand, true)
  end
end
