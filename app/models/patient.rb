class Patient < ApplicationRecord
  validates :name, presence: true
  validates :birth, presence: true
  validates :mobile, presence: true
  validates :job, presence: true
  validates :address, presence: true

  def self.to_csv(options = {})
    CSV.generate(options) do |csv|
      csv << ['姓名', '性别', '生日', '职业', '是否抽烟', '烟龄', '一天几支烟', '邮箱', '地址', '邮编', '家庭电话', '工作电话', '随身电话', '诊断', '注释', 'Fev fvc', 'Fev pred', 'Lung grade']
      all.each do |p|
        csv << [p.name, p.gender, p.birth, p.job, p.smoke, p.smoke_age, p.smoke_freq,
                p.email, p.address, p.postcode, p.home_tel, p.work_tel, p.mobile,
                p.diagnose, p.note, p.fev_fvc, p.fev_pred, p.lung_grade]
      end
    end
  end

  def patient_type_o
    patient_type == 'copd' ? 'COPD' : '哮喘'
  end

  def gender_o
    gender == '1' ? '男' : '女'
  end
end
