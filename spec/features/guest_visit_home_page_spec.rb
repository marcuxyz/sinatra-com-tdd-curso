# frozen_string_literal: true

feature 'Guest visit home page' do
  scenario 'with successfully' do
    visit '/'

    expect(status_code).to be(200)
  end

  scenario 'see menu' do
    visit '/'

    expect(page).to have_content('Home')
    expect(page).not_to have_content('Nova Postagem')
  end

  scenario 'see posts' do
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
end
