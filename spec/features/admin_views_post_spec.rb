feature 'Admin' do 
  scenario 'delete post' do
    user = User.create(name: 'Marcus Pereira',
                       email: 'preto@marcuspereira.xyz', password: '123456')
    post = Post.create(title: 'Playstation 5 custa 5k', content: 'lorem example im', 
                       category: 'Games', status: 'publicado', user_id: user.id)

    visit "/post/#{post.id}"
    click_on 'Deletar'

    expect(current_path).to eq('/')
    expect(page).not_to have_content('Playstation 5 custa 5k')
  end
  
  scenario 'register new post' do
    User.create(name: 'Marcus Pereira',
                email: 'preto@marcuspereira.xyz', password: '123456')
    visit "/"
    click_on 'Nova Postagem'

    fill_in 'Título', with: 'Ações da Nintendo Aumenta 30% após Super Metroid'
    fill_in 'Conteúdo', with: 'Nintedo dobra o valor das ações'
    select 'Ação', from: 'Categorias'
    select 'Publicado', from: 'Status'
    select 'Marcus Pereira', from: 'Autor'
    click_on 'Cadastrar'

    expect(current_path).to eq('/')
    expect(page).to have_link('Ações da Nintendo Aumenta 30% após Super Metroid')
    expect(page).to have_content('1')
    expect(page).to have_content('1')
  end

end