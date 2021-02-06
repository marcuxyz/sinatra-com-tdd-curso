# frozen_string_literal: true

feature 'Admin register category' do
  scenario 'with successfully' do
    User.create!(name: 'Marcus', email: 'marcus@git.com', password: '123456')

    visit '/'
    click_on 'Entrar'

    fill_in 'Email', with: 'marcus@git.com'
    fill_in 'Senha', with: '123456'
    click_on 'Entrar'

    click_on 'Nova Categoria'

    fill_in 'Nome', with: 'Ação'
    select 'Azul', from: 'Cor'
    click_on 'Cadastrar'

    expect(page).to have_content('Ação')
  end
end
