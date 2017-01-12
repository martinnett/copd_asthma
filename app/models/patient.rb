class Patient < ApplicationRecord
  validates :name, presence: true
  validates :birth, presence: true
  validates :mobile, presence: true
  validates :job, presence: true
  validates :address, presence: true

  scope :copd, -> { where(patient_type: 'copd') }
  scope :asthma, -> { where(patient_type: 'asthma') }

  def patient_type_o
    patient_type == 'copd' ? 'COPD' : '哮喘'
  end

  def gender_o
    gender == '1' ? '男' : '女'
  end
end
