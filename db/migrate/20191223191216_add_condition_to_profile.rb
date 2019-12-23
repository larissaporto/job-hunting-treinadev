class AddConditionToProfile < ActiveRecord::Migration[5.2]
  def change
    add_column :profiles, :condition, :integer, default: 0
  end
end
