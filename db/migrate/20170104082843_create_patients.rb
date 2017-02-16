class CreatePatients < ActiveRecord::Migration[5.0]
  def change
    create_table :patients do |t|
      t.string :name
      t.string :gender
      t.date :birth
      t.string :age
      t.string :job
      t.string :smoke
      t.string :smoke_age
      t.string :smoke_freq
      t.string :email
      t.string :address
      t.string :postcode
      t.string :home_tel
      t.string :work_tel
      t.string :mobile
      t.string :patient_type
      t.string :diagnose
      t.text :note
      t.string :fev_fvc
      t.string :fev_pred
      t.string :lung_grade
      t.string :user_id

      t.timestamps
    end
  end
end
