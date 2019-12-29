require 'rails_helper'

feature 'Applicant searches for a job' do
    scenario 'successfully' do
        applicant = Applicant.create!(email: 'test@test.com', password: '123456')
        headhunter = Headhunter.create!(email: 'test@test.com', password: '123456')
        profile = Profile.create!(name: 'Aninha', social_name: 'Pedro', birth_date: '13/12/1990',
                                qualification: 0, description: 'Sou comunicativo, gosto de responsabilidades',
                                experience: 'Trabalhei na empresa X', applicant: applicant,
                                photo: Rails.root.join('spec', 'support', 'images.jpeg'),
                                condition: :done)
        job = Job.create!(title: 'Vaga analista desenvolvedor', description: 'Empresa X está a procura de Juniors',
                        skills: 'Ruby on Rails', salary_from: 5000, salary_to: 10000, headhunter: headhunter,
                        end_date: 3.days.from_now, where: 'Avenida Paulista', job_level: 0)
        otherjob = Job.create!(title: 'Vaga analista de suporte', description: 'Empresa Y está a procura de Juniors',
                            skills: 'Ruby on Rails', salary_from: 5000, salary_to: 10000, headhunter: headhunter,
                            end_date: 3.days.from_now, where: 'Avenida Paulista', job_level: 0)
        anotherjob = Job.create!(title: 'Vaga redes', description: 'Empresa Z está a procura de Juniors',
                                skills: 'Ruby on Rails', salary_from: 5000, salary_to: 10000, headhunter: headhunter,
                                end_date: 3.days.from_now, where: 'Avenida Paulista', job_level: 0)

        login_as(applicant, scope: :applicant)


        visit root_path
        click_on 'Vagas'
        fill_in 'Busca', with: 'Vaga analista'
        click_on 'Buscar'

        expect(page).to have_content(job.title)
        expect(page).to have_content(otherjob.title)
        expect(page).not_to have_content(anotherjob.title)
    end
end