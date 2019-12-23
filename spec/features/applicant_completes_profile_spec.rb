require 'rails_helper'

feature 'Applicant creates his profile' do
    scenario 'successfully' do
        applicant = Applicant.create!(email: 'applicant@applicant.com', 
                                      password: '123456')
        
        login_as(applicant, scope: :applicant)

        visit root_path
        click_on 'Novo Perfil'
        
        fill_in 'Nome', with: 'Aninha'
        fill_in 'Nome Social', with: 'Pedro'
        fill_in 'Data de Nascimento', with: '13/12/1990'
        select 'Bacharelado', from: 'Formação'
        fill_in 'Descrição', with: 'Sou comunicativo, gosto de responsabilidades'
        fill_in 'Experiência', with: 'Trabalhei na empresa X'
        attach_file('Foto', Rails.root.join('spec', 'support', 'images.jpeg'))

        click_on 'Criar Perfil'

        expect(page).to have_content('Pedro') 
        expect(page).to have_content('Perfil salvo')
        expect(page).not_to have_content('Aninha')
        expect(page).to have_css("img[src*='images.jpeg']")

    end
end