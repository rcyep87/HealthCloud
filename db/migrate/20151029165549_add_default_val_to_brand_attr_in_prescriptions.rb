class AddDefaultValToBrandAttrInPrescriptions < ActiveRecord::Migration
  def change
    change_column_default :prescriptions, :brand, false
  end
end
