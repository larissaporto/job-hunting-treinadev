class CreateApplies < ActiveRecord::Migration[5.2]
  def change
    create_table :applies do |t|
      t.references :job, foreign_key: true
      t.references :profile, foreign_key: true
      t.text :cover_letter

      t.timestamps
    end
  end
end
