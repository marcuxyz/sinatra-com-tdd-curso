feature 'Admin register post' do
  scenario 'with successfully' do
    category = Category.create(name: 'Ação')
    User.create(name: 'Marcus Pereira',
                email: 'preto@marcuspereira.xyz', password: '123456')
    visit '/'
    click_on 'Nova Postagem'

    fill_in 'Título', with: 'Ações da Nintendo Aumenta 30% após Super Metroid'
    fill_in 'Conteúdo', with: 'Nintedo dobra o valor das ações'
    select 'Ação', from: 'Categorias'
    select 'Publicado', from: 'Status'
    select 'Marcus Pereira', from: 'Autor'
    click_on 'Cadastrar'

    expect(current_path).to eq('/')
    expect(page).to have_link('Ações da Nintendo Aumenta 30% após Super Metroid')
    expect(page).to have_content('Ação')
    expect(page).to have_content('publicado')
  end
end
