class Patient < ApplicationRecord
  validates :name, presence: true
  validates :age, presence: true
  validates :gender, presence: true
  validates :birth, presence: true
  validates :mobile, presence: true
  validates :smoke, presence: true
  validates :smoke_age, presence: :is_smoker?
  validates :smoke_freq, presence: :is_smoker?
  validates :job, presence: true
  validates :address, presence: true

  scope :copd, -> { where(patient_type: 'copd') }
  scope :asthma, -> { where(patient_type: 'asthma') }

  def is_smoker?
    smoke == 1 || smoke == 3
  end

  def patient_type_o
    patient_type == 'copd' ? 'COPD' : '哮喘'
  end

  def gender_o
    gender == '1' ? '男' : '女'
  end

  def smoke_o
    smoke_items = %w(吸烟 不吸烟 已戒烟)
    result = smoke_items[smoke.to_i - 1]
    result = result + '（已吸烟' + smoke_age + '年，' + smoke_freq + '支/日' + '）' unless (patient_type == 'asthma' || smoke == 2)
    result
  end
end
