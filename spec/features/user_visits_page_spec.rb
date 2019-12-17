require 'rails_helper'

feature 'Visitor opens homepage' do
    scenario 'successfully' do
        visit root_path
        expect(page).to have_content('Jobs')        
        expect(page).to have_content('A página que une candidatos para o emprego dos sonhos')
        expect(page).to have_link('Entrar')        
    end
end
