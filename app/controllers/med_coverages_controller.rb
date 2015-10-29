class MedCoveragesController < ApplicationController
  before_action :set_med_coverage, only: [:show, :edit, :update, :destroy]

  # GET /med_coverages
  # GET /med_coverages.json
  def index
    @med_coverages = MedCoverage.all
  end

  # GET /med_coverages/1
  # GET /med_coverages/1.json
  def show
  end

  # GET /med_coverages/new
  def new
    @med_coverage = MedCoverage.new
  end

  # GET /med_coverages/1/edit
  def edit
  end

  # POST /med_coverages
  # POST /med_coverages.json
  def create
    @med_coverage = MedCoverage.new(med_coverage_params)

    respond_to do |format|
      if @med_coverage.save
        format.html { redirect_to @med_coverage, notice: 'Med coverage was successfully created.' }
        format.json { render :show, status: :created, location: @med_coverage }
      else
        format.html { render :new }
        format.json { render json: @med_coverage.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /med_coverages/1
  # PATCH/PUT /med_coverages/1.json
  def update
    respond_to do |format|
      if @med_coverage.update(med_coverage_params)
        format.html { redirect_to @med_coverage, notice: 'Med coverage was successfully updated.' }
        format.json { render :show, status: :ok, location: @med_coverage }
      else
        format.html { render :edit }
        format.json { render json: @med_coverage.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /med_coverages/1
  # DELETE /med_coverages/1.json
  def destroy
    @med_coverage.destroy
    respond_to do |format|
      format.html { redirect_to med_coverages_url, notice: 'Med coverage was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_med_coverage
      @med_coverage = MedCoverage.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def med_coverage_params
      params.require(:med_coverage).permit(:carrier, :plan_level, :network_type, :pcp_fee, :specialist_fee, :er_fee, :rx_brand_fee, :rx_generic_fee, :in_net_deduct_ind, :in_net_deduct_fam, :out_net_deduct_ind, :out_net_deduct_fam, :co_ins_percent, :out_of_pocket_max, :renewal_date, :user_id)
    end
end
