class HealthDataController < ApplicationController
  def show
    @step = Step.new
    @step.user = current_user

    @sleep = Sleep.new
    @sleep.user = current_user
  end
end
