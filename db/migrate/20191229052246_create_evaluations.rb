class CreateEvaluations < ActiveRecord::Migration[5.2]
  def change
    create_table :evaluations do |t|
      t.text :body
      t.integer :status, default: 0
      t.references :proposal, foreign_key: true

      t.timestamps
    end
  end
end
