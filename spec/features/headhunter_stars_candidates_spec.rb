require 'rails_helper'

feature 'Headhunter stars candidates' do
    scenario 'sucessfully' do
        headhunter = Headhunter.create!(email: 'test@test.com', password: '123456')
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
        apply = Apply.create!(job: job, profile: profile, cover_letter: 'Trabalhei com A há 5 anos')
        otherapply = Apply.create!(job: job, profile: otherprofile, cover_letter: 'Trabalhei com B há 5 anos')

        login_as(headhunter, scope: :headhunter)

        visit candidates_job_path(job)
        
        first('li a').click
        
        apply.reload
        expect(apply).to be_starred
        
    end
end