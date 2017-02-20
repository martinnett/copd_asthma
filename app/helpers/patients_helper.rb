module PatientsHelper
  def export_path(pt)
    if pt == 'copd'
      copd_patients_path(format: 'xls')
    else
      asthma_patients_path(format: 'xls')
    end
  end
end
