feature 'Visitor' do
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
    category = Category.create(name: 'Ação')
    user = User.create(name: 'Marcus Pereira',
                       email: 'preto@marcuspereira.xyz', password: '123456')
    post = Post.create(title: 'Xbox One Vende 10M', content: 'lorem example im',
                       status: 'publicado', user: user, category: category)

    visit '/'

    expect(page).to have_content(post.title)
    expect(page).to have_content(post.category.name)
    expect(page).to have_content(post.status)
  end

  scenario 'visit post' do
    category = Category.create(name: 'Ação')
    user = User.create(
      name: 'Marcus Pereira',
      email: 'preto@marcuspereira.xyz',
      password: '123456'
    )
    post = Post.create(
      title: 'Microsoft lança xbox one x', category: category,
      content: 'lorem example im', status: 'publicado',
      user: user
    )

    visit '/'
    click_on post.title

    expect(page).to have_content(post.title)
    expect(page).to have_content(post.content)
    expect(page).to have_content(post.category.name)
    expect(page).to have_content(post.status)
    expect(page).to have_link('Deletar')
  end
end
