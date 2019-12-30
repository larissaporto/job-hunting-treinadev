class Evaluation < ApplicationRecord
  belongs_to :proposal
  validates :body, presence: true

  enum status: [:to_do, :did]
end
