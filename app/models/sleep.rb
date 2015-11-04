class Sleep < ActiveRecord::Base
  belongs_to :user

  def formatted_sleep_date
    self.refill_till.strftime("%B %d, %Y")
  end
  
end
