class PrescriptionsController < ApplicationController
  before_action :set_prescription, only: [:show, :edit, :update, :destroy]
  before_filter :authenticate_user!, except: [:new, :create]

  # GET /prescriptions
  # GET /prescriptions.json
  def index
    @page = (params[:page] || 0).to_i
    @limit = (params[:limit] || 10).to_i
    @user_prescriptions = current_user.prescriptions.limit(@limit).offset(@page * @limit)
    @rx_alert = RxAlert.new
    @rx_alert.user = current_user
  end

  # GET /prescriptions/1
  # GET /prescriptions/1.json
  def show
  end

  # GET /prescriptions/new
  def new
    @prescription = Prescription.new
  end

  # GET /prescriptions/1/edit
  def edit
  end

  # POST /prescriptions
  # POST /prescriptions.json
  def create
    @prescription = Prescription.new(prescription_params)
    @prescription.user = current_user

    respond_to do |format|
      if @prescription.save
        format.html { redirect_to ehr_path, notice: 'Prescription was successfully created.' }
        format.json { render :show, status: :created, location: @prescription }
      else
        format.html { render :new }
        format.json { render json: @prescription.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /prescriptions/1
  # PATCH/PUT /prescriptions/1.json
  def update
    respond_to do |format|
      if @prescription.update(prescription_params)
        format.html { redirect_to @prescription, notice: 'Prescription was successfully updated.' }
        format.json { render :show, status: :ok, location: @prescription }
      else
        format.html { render :edit }
        format.json { render json: @prescription.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /prescriptions/1
  # DELETE /prescriptions/1.json
  def destroy
    @prescription.destroy
    respond_to do |format|
      format.html { redirect_to prescriptions_url, notice: 'Prescription was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_prescription
      @prescription = Prescription.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def prescription_params
      params.require(:prescription).permit(:name, :dosage, :frequency, :brand, :date_prescribed, :refill_till, :rx_notes, :user_id, :prescription_id)
    end
end
