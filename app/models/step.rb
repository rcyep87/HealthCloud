class Step < ActiveRecord::Base
  belongs_to :user

  def formatted_step_date
    self.date_of_steps.strftime("%B %d, %Y")
  end

end
