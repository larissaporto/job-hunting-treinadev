require 'rails_helper'

RSpec.describe Job, type: :model do
    describe 'end_date_must_be_different_than_current' do
        it 'sucess' do
            headhunter = Headhunter.create!(email: 'test@test.com', password: '123456')
            job = Job.new(title: 'Vaga analista desenvolvedor', description: 'Empresa X está a procura de Juniors',
                        skills: 'Ruby on Rails', salary_from: 5000, salary_to: 10000, headhunter: headhunter,
                        end_date: 3.days.from_now, where: 'Avenida Paulista', job_level: 0)
            job.valid?

            expect(job.errors).to be_empty
        end

        it 'end date equal to current date' do
            job = Job.new(end_date: Date.today)

            job.valid?

            expect(job.errors.full_messages).to include(
                'Data Fim não pode ser igual ou menor a data de hoje'
            )
        end

        it 'end date equal to current date' do
            job = Job.new(end_date: Date.yesterday)

            job.valid?

            expect(job.errors.full_messages).to include(
                'Data Fim não pode ser igual ou menor a data de hoje'
            )
        end
    end
end
