class UpdateUserModelToAllowNullForFirstLastDobSsn < ActiveRecord::Migration
  def change
    change_column_null(:users, :first_name, true)
    change_column_null(:users, :last_name,  true)
    change_column_null(:users, :dob,        true)
    change_column_null(:users, :ssn,        true)
  end
end
