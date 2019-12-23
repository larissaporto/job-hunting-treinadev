class CreateProfiles < ActiveRecord::Migration[5.2]
  def change
    create_table :profiles do |t|
      t.string :name
      t.string :social_name
      t.date :birth_date
      t.integer :qualification, default: 0
      t.text :description
      t.text :experience
      t.references :applicant, foreign_key: true

      t.timestamps
    end
  end
end
