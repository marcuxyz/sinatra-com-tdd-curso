feature 'User views' do
  scenario 'and access log in page' do
    visit '/'

    expect(status_code).to be(200)
    expect(page).to have_content('Entrar')
  end

  scenario 'and log in' do
    User.create!(name: 'Marcus', email: 'marcus@git.com', password: '123456')

    visit '/'
    click_on 'Entrar'

    fill_in 'Email', with: 'marcus@git.com'
    fill_in 'Senha', with: '123456'
    click_on 'Entrar'

    click_on 'Nova Postagem'

    expect(page).not_to have_content('Entrar')
    expect(page).to have_content('Novo Post')
  end

  scenario 'see not logout button' do
    visit '/'

    expect(page).not_to have_content('Sair')
  end

  scenario 'see logout button' do
    User.create!(name: 'Marcus', email: 'marcus@git.com', password: '123456')

    visit '/'
    click_on 'Entrar'

    fill_in 'Email', with: 'marcus@git.com'
    fill_in 'Senha', with: '123456'
    click_on 'Entrar'

    expect(page).to have_content('Sair')
  end

  scenario 'see logout button' do
    User.create!(name: 'Marcus', email: 'marcus@git.com', password: '123456')

    visit '/'
    click_on 'Entrar'

    fill_in 'Email', with: 'marcus@git.com'
    fill_in 'Senha', with: '123456'
    click_on 'Entrar'

    visit '/sair'

    expect(page).not_to have_content('Sair')
    expect(page).not_to have_content('Nova Postagem')
    expect(page).not_to have_content('Nova Categoria')
  end
end
