class Evaluation < ApplicationRecord
  belongs_to :proposal

  enum status: [:to_do, :did]
end
