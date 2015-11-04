class AddNullFalseToStepsTable < ActiveRecord::Migration
  def change
    change_column_null(:steps, :date_of_steps, false)
  end
end
