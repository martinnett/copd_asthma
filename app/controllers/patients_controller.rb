class PatientsController < ApplicationController
  before_action :set_patient, only: [:show, :edit, :update, :destroy]
  before_action :auth_check

  def index
    @patients = Patient.all
    @patients = Patient.where(user_id: current_user.id) unless current_user.admin?
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
        flash.now[:success] = '患者登记成功！'
        format.html { redirect_to patients_url }
      else
        format.html { render 'new' }
      end
    end
  end

  def update
    # debugger
    respond_to do |format|
      if @patient.update(patient_params)
        flash.now[:success] = '患者更新成功！'
        format.html { redirect_to patients_url }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    @patient.destroy
    respond_to do |format|
      format.html { redirect_to patients_url, notice: '患者删除成功！' }
    end
  end

  private

  def set_patient
    @patient = Patient.find(params[:id])
  end

  def patient_params
    params.require(:patient)
          .permit(:name, :age, :gender, :birth, :job, :smoke, :smoke_age, :smoke_freq, :email, :address, :postcode, :home_tel, :work_tel, :mobile, :patient_type, :diagnose, :note, :fev_fvc, :fev_pred, :lung_grade, :user_id)
  end
end
