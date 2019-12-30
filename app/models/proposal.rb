class Proposal < ApplicationRecord
    belongs_to :apply
    has_many :evaluations
    validates :start_date, :salary, :position, :job_details, 
              :benefits, :addicional_info, presence: true, on: :update

    enum applicant_answer: [:pondering, :positive, :negative]

    def start_date_must_be_different_than_current
        if start_date <= Date.today
            errors.add(:end_date, 'não pode ser igual ou menor a data de hoje')

        end
        if start_date.blank?
            errors.add(:end_date, 'não pode ser vazio')
        end
    end
end
