class Prescription < ActiveRecord::Base
  has_paper_trail
  belongs_to :user
  has_many :rx_alerts

  def formatted_date_prescribed
    self.date_prescribed.strftime("%B %d, %Y")
  end

  def formatted_refill_till
    self.refill_till.strftime("%B %d, %Y")
  end

end
