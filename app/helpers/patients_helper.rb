module PatientsHelper
  def export_path
    if controller.action_name == 'copd'
      copd_patients_path(format: 'xls')
    else
      asthma_patients_path(format: 'xls')
    end
  end
end
