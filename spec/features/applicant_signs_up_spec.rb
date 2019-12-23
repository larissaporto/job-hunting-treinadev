require 'rails_helper'

feature 'Applicant signs up' do
    scenario 'successfully' do
        visit root_path
        click_on 'Login Candidato'
        click_on 'Sign up'

        fill_in 'Email', with: 'test@test.com'
        fill_in 'Senha', with: '123456'
        fill_in 'Confirme sua senha', with: '123456'
        click_on 'Sign up'

    expect(page).to have_link('Perfil')
    end
end