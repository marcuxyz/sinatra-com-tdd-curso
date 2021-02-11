# frozen_string_literal: true

feature 'Admin Register Post' do
  scenario 'with successfully' do
    Category.create!(name: 'Terror')
    User.create!(name: 'Marcus', email: 'marcus@git.com', password: '123456')

    visit '/'
    click_on 'Entrar'

    fill_in 'Email', with: 'marcus@git.com'
    fill_in 'Senha', with: '123456'
    click_on 'Acessar'

    click_on 'Nova Postagem'

    fill_in 'Título', with: 'Ações da Nintendo Subiram 30%'
    fill_in 'Conteúdo', with: 'Nintendo fala sobre ações'
    select 'Terror', from: 'Categorias'
    click_on 'Cadastrar'

    expect(current_path).to eq('/')
    expect(page).to have_content('Ações da Nintendo Subiram 30%')
    expect(page).to have_content('Terror')
    expect(page).to have_content('Publicado')
    expect(page).to have_content('Marcus')
  end
end
