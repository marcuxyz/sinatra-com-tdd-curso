# frozen_string_literal: true

feature 'Admin Register Category' do
  scenario 'with successfully' do
    User.create!(name: 'Marcus', email: 'marcus@git.com', password: '123456')

    visit '/'
    click_on 'Entrar'

    # faz o login
    fill_in 'Email', with: 'marcus@git.com'
    fill_in 'Senha', with: '123456'
    click_on 'Acessar'

    click_on 'Nova Categoria'

    fill_in 'Nome', with: 'Terror'
    select 'Azul', from: 'Cor'
    click_on 'Cadastrar'

    expect(current_path).to eq('/')
    expect(page).to have_content('Terror')
  end
end
