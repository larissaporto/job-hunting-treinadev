require 'rails_helper'

feature 'Headhunter see all that applied to the job' do
    scenario 'successfully' do
        headhunter = Headhunter.create!(email: 'test@test.com', password: '123456')
        otherheadhunter = Headhunter.create!(email: 'test1@test.com', password: '123456')
        applicant = Applicant.create!(email: 'test@test.com', password: '123456')
        profile = Profile.create!(name: 'Aninha', social_name: 'Pedro', birth_date: '13/12/1990',
                                qualification: 0, description: 'Sou comunicativo, gosto de responsabilidades',
                                experience: 'Trabalhei na empresa X', applicant: applicant,
                                photo: Rails.root.join('spec', 'support', 'images.jpeg'),
                                condition: :done)
        otherapplicant = Applicant.create!(email: 'test1@test.com', password: '123456')
        otherprofile = Profile.create!(name: 'Augusto', social_name: 'Virginia', birth_date: '11/12/1990',
                                qualification: 0, description: 'Sou comunicativa, gosto de responsabilidades',
                                experience: 'Trabalhei na empresa Y', applicant: otherapplicant,
                                photo: Rails.root.join('spec', 'support', 'images.jpeg'),
                                condition: :done)
        job = Job.create!(title: 'Vaga desenvolvedor', description: 'Empresa X está a procura de Juniors',
                        skills: 'Ruby on Rails', salary_from: 5000, salary_to: 10000, headhunter: headhunter, 
                        end_date: 3.days.from_now, where: 'Avenida Paulista', job_level: 0)
        otherjob = Job.create!(title: 'Vaga suporte', description: 'Empresa Y está a procura de Juniors',
                            skills: 'Ruby on Rails', salary_from: 5000, salary_to: 10000, headhunter: otherheadhunter,
                            end_date: 3.days.from_now, where: 'Avenida Paulista', job_level: 0)
        apply = Apply.create!(job: job, profile: profile, cover_letter: 'Trabalhei com A há 5 anos')
        otherapply = Apply.create!(job: otherjob, profile: otherprofile, cover_letter: 'Trabalhei com B há 5 anos')
        
        login_as(headhunter, scope: :headhunter)

        visit root_path
        click_on 'Vagas Cadastradas'
        click_on job.title
        click_on 'Candidatos'

        expect(page).to have_content(profile.name)
        expect(page).not_to have_content(otherprofile.name)
    end    
end