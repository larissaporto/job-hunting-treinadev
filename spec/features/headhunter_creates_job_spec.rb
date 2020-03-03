require 'rails_helper'

feature 'Headhunter creates a job vacancy' do
  scenario 'successfully' do
    headhunter = Headhunter.create!(email: 'test@test.com', password: '123456')

    login_as(headhunter, scope: :headhunter)
    visit root_path
    click_on 'Vagas'
    click_on 'Criar nova vaga'

    fill_in 'Título', with: 'Vaga desenvolvedor'
    fill_in 'Descrição', with: 'Empresa X está a procura de Juniors'
    fill_in 'Habilidades', with: 'Ruby on Rails'
    fill_in 'Salário de', with: 5000
    fill_in 'Salário até', with: 10_000
    fill_in 'Data Fim', with: '05/01/2100'
    fill_in 'Região', with: 'Avenida Paulista'
    choose 'Júnior'
    click_on 'Criar Vaga'

    expect(page).to have_content('Vaga desenvolvedor')
    expect(page).to have_content('Vaga criada com sucesso')
  end
end
