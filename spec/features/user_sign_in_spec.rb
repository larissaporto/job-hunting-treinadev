require 'rails_helper'

feature 'applicant sign in' do
    scenario 'successfully' do
        applicant = Applicant.create!(email: 'test@test.com', password: '123456')

        visit root_path
        click_on 'Login Candidato'
        fill_in 'Email', with: applicant.email
        fill_in 'Senha', with: applicant.password
        click_on 'Log in'
        
        expect(current_path).to eq(edit_profile_path(applicant.profile))
        expect(page).to have_content('Login efetuado com sucesso.')
        expect(page).to have_link('Sair')
        expect(page).not_to have_link('Login Candidato')
    end

    scenario 'and log out' do
        applicant = Applicant.create!(email: 'test@test.com', password: '123456')

        visit root_path
        click_on 'Login Candidato'
        fill_in 'Email', with: applicant.email
        fill_in 'Senha', with: applicant.password
        click_on 'Log in' 
        click_on 'Sair'
        
        expect(current_path).to eq(root_path)
        expect(page).to have_content('Logout efetuado com sucesso.')
        expect(page).to have_link('Login Candidato')
        expect(page).not_to have_link('Sair')
    end
end
feature 'headhunter sign in' do
    scenario 'successfully' do
        headhunter = Headhunter.create!(email: 'test@test.com', password: '123456')

        visit root_path
        click_on 'Login Headhunter'
        fill_in 'Email', with: headhunter.email
        fill_in 'Senha', with: headhunter.password
        click_on 'Log in'
        
        expect(current_path).to eq(root_path)
        expect(page).to have_content('Login efetuado com sucesso.')
        expect(page).to have_link('Sair')
        expect(page).not_to have_link('Login Headhunter')
    end

    scenario 'and log out' do
        headhunter = Headhunter.create!(email: 'test@test.com', password: '123456')

        visit root_path
        click_on 'Login Headhunter'
        fill_in 'Email', with: headhunter.email
        fill_in 'Senha', with: headhunter.password
        click_on 'Log in' 
        click_on 'Sair'
        
        expect(current_path).to eq(root_path)
        expect(page).to have_content('Logout efetuado com sucesso.')
        expect(page).to have_link('Login Headhunter')
        expect(page).not_to have_link('Sair')
    end
end