class PatientsController < ApplicationController
  before_action :set_patient, only: [:edit, :update, :destroy]
  before_action :auth_check

  def copd
    @patients = if current_user.admin?
                  Patient.copd
                else
                  Patient.copd.where(user_id: current_user.id)
                end
    respond_to do |format|
      format.html
      format.xls
    end
  end

  def asthma
    @patients = if current_user.admin?
                  Patient.asthma
                else
                  Patient.asthma.where(user_id: current_user.id)
                end
    respond_to do |format|
      format.html
      format.xls
    end
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
        format.html do
          if @patient.patient_type == 'copd'
            redirect_to copd_patients_path
          else
            redirect_to asthma_patients_path
          end
        end
      else
        format.html { render :new }
      end
    end
  end

  def update
    # debugger
    respond_to do |format|
      if @patient.update(patient_params)
        flash.now[:success] = '患者更新成功！'
        format.html do
          if @patient.patient_type == 'copd'
            redirect_to copd_patients_path
          else
            redirect_to asthma_patients_path
          end
        end
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    @patient.destroy
    respond_to do |format|
      format.html do
        if @patient.patient_type == 'copd'
          redirect_to copd_patients_path, notice: '患者删除成功！'
        else
          redirect_to asthma_patients_path, notice: '患者删除成功！'
        end
      end
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
