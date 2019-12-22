class CreateJobs < ActiveRecord::Migration[5.2]
  def change
    create_table :jobs do |t|
      t.string :title
      t.text :description
      t.string :skills
      t.decimal :salary_from
      t.decimal :salary_to
      t.date :end_date
      t.string :where

      t.timestamps
    end
  end
end
