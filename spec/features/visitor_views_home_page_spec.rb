# frozen_string_literal: true

feature 'Visitor Visit Home Page' do
  scenario 'with successfully' do
    visit '/'

    expect(status_code).to eq(200)
  end

  scenario 'and see menu' do
    visit '/'

    expect(page).to have_content('Home')
  end

  scenario 'and see post' do
    user = User.create(
      name: 'Marcus Pereira',
      email: 'marcus@git.com',
      password: '123'
    )
    category = Category.create(
      name: 'Ação',
      color: 'success'
    )
    post = Post.create(
      title: 'Tomb Raider vai ser lançado em Jan de 2020',
      content: 'um conteudo qualquer sobre o jogo tomb raider',
      user: user,
      category: category
    )

    visit '/'

    expect(page).to have_content(post.title)
    expect(page).to have_content(post.category.name)
    expect(page).to have_content(post.status)
  end
end
