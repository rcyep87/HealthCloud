class HealthDataController < ApplicationController
  def show
    @steps = Step.new
    @steps.user = current_user

    @sleeps = Sleep.new
    @sleeps.user = current_user
  end
end
