class AddDateOfStepsToStepsTable < ActiveRecord::Migration
  def change
    add_column(:steps, :date_of_steps, :date)
  end
end
