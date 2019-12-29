class Proposal < ApplicationRecord
    belongs_to :apply
    has_many :evaluations

    enum applicant_answer: [:pondering, :positive, :negative]
end
