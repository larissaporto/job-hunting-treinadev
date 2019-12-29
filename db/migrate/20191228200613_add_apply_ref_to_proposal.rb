class AddApplyRefToProposal < ActiveRecord::Migration[5.2]
  def change
    add_reference :proposals, :apply, foreign_key: true
  end
end
