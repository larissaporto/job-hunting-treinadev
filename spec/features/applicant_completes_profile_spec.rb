require 'rails_helper'

feature 'Applicant creates his profile' do
    scenario 'successfully' do
        applicant = Applicant.create!(email: 'applicant@applicant.com', 
                                      password: '123456')
        
        login_as(applicant, scope: :applicant)

        visit root_path
        click_on 'Perfil'
        click_on 'Editar Perfil'
        
        fill_in 'Nome', with: 'Aninha'
        fill_in 'Nome Social', with: 'Pedro'
        fill_in 'Data de Nascimento', with: '12/12/1990'
        select 'Bacharelado', from: 'Formação'
        fill_in 'Descrição', with: 'Sou comunicativa, gosto de responsabilidades'
        fill_in 'Experiência', with: 'Trabalhei na empresa X'
        attach_file('Image', Rails.root.join('spec', 'support', 'images.jpeg'))

        click_on 'Editar Perfil'

        expect(page).to have_content('Aninha') 
        expect(page).to have_content('Perfil atualizado com sucesso')
        expect(page).to have_css("img[src*='images.jpeg']")

    end
end