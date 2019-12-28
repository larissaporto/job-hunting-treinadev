require 'rails_helper'

feature 'Applicant views rejection s feedback' do
    scenario 'successfully' do
        headhunter = Headhunter.create!(email: 'test@test.com', password: '123456')
        applicant = Applicant.create!(email: 'test@test.com', password: '123456')
        profile = Profile.create!(name: 'Aninha', social_name: 'Pedro', birth_date: '13/12/1990',
                                qualification: 0, description: 'Sou comunicativo, gosto de responsabilidades',
                                experience: 'Trabalhei na empresa X', applicant: applicant,
                                photo: Rails.root.join('spec', 'support', 'images.jpeg'),
                                condition: :done)
        job = Job.create!(title: 'Vaga desenvolvedor', description: 'Empresa X está a procura de Juniors',
                        skills: 'Ruby on Rails', salary_from: 5000, salary_to: 10000, headhunter: headhunter, 
                        end_date: 3.days.from_now, where: 'Avenida Paulista', job_level: 0)
        apply = Apply.create!(job: job, profile: profile, cover_letter: 'Trabalhei com A há 5 anos', 
                            applicant_status: :rejected)
        feedback = Feedback.create!(apply: apply, body: 'Fale mais sobre você, acrescente seu perfil!')
        
        login_as(applicant, scope: :applicant)
        visit my_jobs_profile_path(profile)

        expect(page).to have_content(feedback.body)
        expect(page).to have_content(job.title)

    end
end