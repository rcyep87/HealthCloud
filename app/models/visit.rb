class Visit < ActiveRecord::Base
  has_paper_trail
  belongs_to :user

  def formatted_dos
    self.dos.strftime("%B %d, %Y")
  end

end
