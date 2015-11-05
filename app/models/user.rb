class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :visits
  has_many :prescriptions
  has_one  :med_coverage
  has_many :steps
  has_many :sleeps
  has_many :exercises
  has_many :rx_alerts

  has_paper_trail

  def current_prescriptions
    prescriptions.where("refill_till >= '#{Time.now}'")
  end

  def most_recent_dr_visit
    visits.order(dos: :desc).limit(1)
  end

  def most_recent_rx
    prescriptions.order(date_prescribed: :desc).limit(1)
  end

  def user_prescriptions
    prescriptions
  end

  def today_steps
    steps.order(date_of_steps: :desc).limit(1)
  end

  def today_slept_hours
    sleeps.order(date_of_sleep: :desc).limit(1)
  end

end
