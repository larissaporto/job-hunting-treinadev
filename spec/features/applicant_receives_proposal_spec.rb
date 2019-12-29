require 'rails_helper'

feature 'Applicant receives job proposal' do
    scenario 'successfully' do
        otherheadhunter = Headhunter.create!(email: 'test1@test.com', password: '123456')
        otherjob = Job.create!(title: 'Vaga suporte', description: 'Empresa Y está a procura de Juniors',
                            skills: 'Ruby on Rails', salary_from: 5000, salary_to: 10000, headhunter: otherheadhunter,
                            end_date: 3.days.from_now, where: 'Avenida Paulista', job_level: 0)       
        anotherjob = Job.create!(title: 'Vaga redes', description: 'Empresa Z está a procura de Juniors',
                                skills: 'Ruby on Rails', salary_from: 5000, salary_to: 10000, headhunter: otherheadhunter,
                                end_date: 3.days.from_now, where: 'Avenida Paulista', job_level: 0)
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
                            applicant_status: :accepted)
        otherapply = Apply.create!(job: otherjob, profile: profile, cover_letter: 'Trabalhei com B há 5 anos',
                                  applicant_status: :accepted)
        anotherapply = Apply.create!(job: anotherjob, profile: profile, cover_letter: 'Trabalhei com C há 5 anos',
                                    applicant_status: :accepted)
        proposal = Proposal.create!(apply: apply, position: 'Analista', job_details: 'RoR', start_date: '01/01/2020', 
                                     salary: 5000, bonus: 500, benefits: 'Odonto', addicional_info: 'Musculação')
        otherproposal = Proposal.create!(apply: otherapply, position: 'Suporte', job_details: 'RoR1', start_date: '02/01/2020', 
                                         salary: 4000, bonus: 400, benefits: 'Odonto', addicional_info: 'Musculação')
        anotherproposal = Proposal.create!(apply: anotherapply, position: 'Redes', job_details: 'RoR2', start_date: '03/01/2020', 
                                           salary: 3000, bonus: 300, benefits: 'Odonto', addicional_info: 'Musculação')

        login_as(applicant, scope: :applicant)

        visit root_path
        click_on 'Minhas Propostas'

        expect(page).to have_content(job.title)
        expect(page).to have_content(otherjob.title)
        expect(page).to have_content(anotherjob.title)
    end
end