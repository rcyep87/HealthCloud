class RxAlertsController < ApplicationController
  before_action :set_prescription, only: [:show, :edit, :update, :destroy]
  before_filter :authenticate_user!, except: [:new, :create]

  def new
    @rx_alert = RxAlert.new
  end

  def create
    @rx_alert = RxAlert.new(rx_alert_params)
    @rx_alert.user = current_user

    respond_to do |format|
      if @rx_alert.save
        format.html { redirect_to ehr_path, notice: 'You have successfully scheduled a reminder.' }
      else
        format.html { render :new }
      end
    end

  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_rx_alert
      @rx_alert = RxAlert.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def rx_alert_params
      params.require(:rx_alert).permit(:time_to_take, :user_id, :prescription_id, :M, :T, :W, :Th, :F, :S, :Su)
    end
end
