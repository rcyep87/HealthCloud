class MedCoverage < ActiveRecord::Base
  has_paper_trail
  belongs_to :user

  def formatted_renewal_date
    self.renewal_date.strftime("%B %d, %Y")
  end

end
