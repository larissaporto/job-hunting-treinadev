require 'rails_helper'

feature 'Applicant applies for a job' do
    scenario 'succefully' do
        applicant = Applicant.create!(email: 'test@test.com', password: '123456')
        headhunter = Headhunter.create!(email: 'test@test.com', password: '123456')
        profile = Profile.create!(name: 'Aninha', social_name: 'Pedro', birth_date: '13/12/1990',
                                qualification: 0, description: 'Sou comunicativo, gosto de responsabilidades',
                                experience: 'Trabalhei na empresa X', applicant: applicant,
                                photo: Rails.root.join('spec', 'support', 'images.jpeg'),
                                condition: :done)
        job = Job.create!(title: 'Vaga desenvolvedor', description: 'Empresa X está a procura de Juniors',
                        skills: 'Ruby on Rails', salary_from: 5000, salary_to: 10000, headhunter: headhunter,
                        end_date: 3.days.from_now, where: 'Avenida Paulista', job_level: 0)
        login_as(applicant, scope: :applicant)

        visit job_path(job)
        click_on 'Inscrição'
        fill_in 'Descrição', with: 'Trabalhei como desenvolvedor há 5 anos'
        click_on 'Se inscrever'

        expect(page).to have_content('Incrição efetuada com sucesso')
    end
end