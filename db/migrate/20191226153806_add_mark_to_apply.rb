class AddMarkToApply < ActiveRecord::Migration[5.2]
  def change
    add_column :applies, :mark, :integer, default: 0
  end
end
