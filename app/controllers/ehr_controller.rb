class EhrController < ApplicationController
  def show
    @visit = Visit.new
    @visit.user = current_user

    @prescription = Prescription.new
    @prescription.user = current_user

    @rx_alert = RxAlert.new
    @rx_alert.user = current_user

  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_visit
      @visit = Visit.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def visit_params
      params.require(:visit).permit(:physician_first, :physician_last, :dos, :reason_for_visit, :diagnosis, :dr_notes, :user_id, :prescription_id)
    end
end
