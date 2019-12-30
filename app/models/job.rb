class Job < ApplicationRecord
    has_many :applies
    has_many :profiles, through: :applies 
    has_many :feedbacks, through: :applies 
    has_many :proposals, through: :applies
    belongs_to :headhunter

    validates :title, :description, :skills, :salary_from, :salary_to,
                :where, presence: true

    validate :end_date_must_be_different_than_current

    enum job_level: { Estágio: 0, Júnior: 5, Pleno: 10, Sênior: 15, Especialista: 20, Diretor: 25 }
    enum status: [:available, :unavailable]

    def name
        Job.human_attribute_name("job_level.#{@job.job_level}")
    end

    def end_date_must_be_different_than_current
        if end_date <= Date.today
            errors.add(:end_date, 'não pode ser igual ou menor a data de hoje')

        end
        if end_date.blank?
            errors.add(:end_date, 'não pode ser vazio')
        end
    end

    def end_date_arrives?
        if end_date > Date.today && job.available
            job.unavailable!
        end
    end

end
