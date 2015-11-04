class AddNullFalseToExercisesTable < ActiveRecord::Migration
  def change
    change_column_null(:exercises, :date_of_steps, false)
  end
end
