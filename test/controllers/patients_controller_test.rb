require 'test_helper'

class PatientsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @patient = patients(:one)
  end

  test "should get index" do
    get patients_url
    assert_response :success
  end

  test "should get new" do
    get new_patient_url
    assert_response :success
  end

  test "should create patient" do
    assert_difference('Patient.count') do
      post patients_url, params: { patient: { address: @patient.address, age: @patient.age, birth: @patient.birth, diagnose: @patient.diagnose, email: @patient.email, fev_fvc: @patient.fev_fvc, fev_pred: @patient.fev_pred, gender: @patient.gender, home_tel: @patient.home_tel, job: @patient.job, lung_grade: @patient.lung_grade, mobile: @patient.mobile, name: @patient.name, note: @patient.note, patient_type: @patient.patient_type, postcode: @patient.postcode, smoke: @patient.smoke, smoke_age: @patient.smoke_age, smoke_freq: @patient.smoke_freq, work_tel: @patient.work_tel } }
    end

    assert_redirected_to patient_url(Patient.last)
  end

  test "should show patient" do
    get patient_url(@patient)
    assert_response :success
  end

  test "should get edit" do
    get edit_patient_url(@patient)
    assert_response :success
  end

  test "should update patient" do
    patch patient_url(@patient), params: { patient: { address: @patient.address, age: @patient.age, birth: @patient.birth, diagnose: @patient.diagnose, email: @patient.email, fev_fvc: @patient.fev_fvc, fev_pred: @patient.fev_pred, gender: @patient.gender, home_tel: @patient.home_tel, job: @patient.job, lung_grade: @patient.lung_grade, mobile: @patient.mobile, name: @patient.name, note: @patient.note, patient_type: @patient.patient_type, postcode: @patient.postcode, smoke: @patient.smoke, smoke_age: @patient.smoke_age, smoke_freq: @patient.smoke_freq, work_tel: @patient.work_tel } }
    assert_redirected_to patient_url(@patient)
  end

  test "should destroy patient" do
    assert_difference('Patient.count', -1) do
      delete patient_url(@patient)
    end

    assert_redirected_to patients_url
  end
end
