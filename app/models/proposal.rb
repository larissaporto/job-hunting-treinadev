class Proposal < ApplicationRecord
    belongs_to :apply

    enum applicant_answer: [:pondering, :positive, :negative]
end
