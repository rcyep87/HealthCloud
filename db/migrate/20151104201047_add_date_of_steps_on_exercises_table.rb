class AddDateOfStepsOnExercisesTable < ActiveRecord::Migration
  def change
    add_column(:exercises, :date_of_steps, :date, null: :false)
  end
end
