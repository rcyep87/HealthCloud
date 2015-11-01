class EhrController < ApplicationController
  def show
    @visit = Visit.new
    @visit.user = current_user
    #
    # respond_to do |format|
    #   if @visit.save
    #     format.html { redirect_to ehr_path, notice: 'Visit was successfully submitted.' }
    #   else
    #     format.html { render :new }
    #   end
    # end
    #
    # render template: "visits/_form.html.erb"
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_visit
      @visit = Visit.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def visit_params
      params.require(:visit).permit(:physician_first, :physician_last, :dos, :reason_for_visit, :diagnosis, :dr_notes, :user_id)
    end
end
