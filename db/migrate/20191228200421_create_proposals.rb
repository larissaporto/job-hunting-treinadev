class CreateProposals < ActiveRecord::Migration[5.2]
  def change
    create_table :proposals do |t|
      t.date :start_date
      t.decimal :salary
      t.string :position
      t.text :job_details
      t.string :benefits
      t.decimal :bonus
      t.text :addicional_info

      t.timestamps
    end
  end
end
