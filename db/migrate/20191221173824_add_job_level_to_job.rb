class AddJobLevelToJob < ActiveRecord::Migration[5.2]
  def change
    add_column :jobs, :job_level, :integer, default: 0
  end
end
