feature 'Visitor' do
  background do
    Capybara.app = HomeController
  end

  scenario 'visit home page with successfully' do
    visit '/'

    expect(status_code).to be(200)
  end

  scenario 'see menu' do
    visit '/'

    expect(page).to have_content('Home')
    expect(page).to have_content('Nova Postagem')
  end

  scenario 'see menu' do
    user = User.create(name: 'Marcus Pereira',
                       email: 'preto@marcuspereira.xyz', password: '123456')
    Post.create!(title: 'Xbox One Vende 10M', content: 'lorem example im',
                 category: 'Games', status: 'publicado', user_id: user.id)

    visit '/'

    expect(page).to have_content('Título: Xbox One Vende 10M')
    expect(page).to have_content('Categoria: Games')
    expect(page).to have_content('Status: publicado')
  end

  scenario 'visit post' do
    user = User.create(
      name: 'Marcus Pereira',
      email: 'preto@marcuspereira.xyz',
      password: '123456'
    )
    post = Post.create(
      title: 'Microsoft lança xbox one x', category: 'Games',
      content: 'lorem example im', status: 'publicado',
      user_id: user.id
    )

    visit '/'
    click_on post.title

    save_page
    
    expect(current_path).to eq("/post/#{post.id}")
    expect(page).to have_content("Título: #{post.title}")
    # expect(page).to have_content(post.content)
    # expect(page).to have_content(post.category)
    # expect(page).to have_content(post.status)
    # expect(page).to have_link('Deletar')
  end
end
