class CreateCopdInfos < ActiveRecord::Migration[5.0]
  def change
    create_table :copd_infos do |t|
      t.integer :user_id
      t.string :name
      t.integer :age
      t.string :gender
      t.datetime :birth_date
      t.string :job
      t.string :is_smoke
      t.integer :smoke_age
      t.integer :smoke_day_number
      t.string :email
      t.string :house_address
      t.integer :zip_code
      t.integer :house_mobile
      t.integer :job_mobile
      t.integer :phone
      t.integer :bronchial_function
      t.integer :lung_level
      t.string :diagnosis
      t.text :remarks
      t.string :type

      t.timestamps
    end
  end
end
