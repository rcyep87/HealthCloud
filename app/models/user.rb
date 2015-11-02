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

  has_paper_trail

  def current_prescriptions
    prescriptions.where("refill_till >= '#{Time.now}'")
  end
end
