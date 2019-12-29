class AddApplicantAnswerToProposal < ActiveRecord::Migration[5.2]
  def change
    add_column :proposals, :applicant_answer, :integer, default: 0
  end
end
