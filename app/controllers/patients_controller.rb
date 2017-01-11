class PatientsController < ApplicationController
  before_action :set_patient, only: [:show, :edit, :update, :destroy]
  before_action :auth_check

  def index
    @patients = Patient.all
    respond_to do |format|
      format.html
      format.xls { send_data @patients.to_csv, filename: '患者信息.xls' }
    end
  end

  def show
  end

  def new
    @patient = Patient.new(patient_type: params[:format])
  end

  def edit
  end

  def create
    @patient = Patient.new(patient_params)

    respond_to do |format|
      if @patient.save
        format.html { redirect_to @patient, notice: 'Patient was successfully created.' }
        format.json { render :show, status: :created, location: @patient }
      else
        format.html { render :new }
        format.json { render json: @patient.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @patient.update(patient_params)
        format.html { redirect_to @patient, notice: 'Patient was successfully updated.' }
        format.json { render :show, status: :ok, location: @patient }
      else
        format.html { render :edit }
        format.json { render json: @patient.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @patient.destroy
    respond_to do |format|
      format.html { redirect_to patients_url, notice: 'Patient was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  def set_patient
    @patient = Patient.find(params[:id])
  end

  def patient_params
    params.require(:patient)
          .permit(:name, :age, :gender, :birth, :job, :smoke, :smoke_age, :smoke_freq, :email, :address, :postcode, :home_tel, :work_tel, :mobile, :patient_type, :diagnose, :note, :fev_fvc, :fev_pred, :lung_grade)
  end
end
