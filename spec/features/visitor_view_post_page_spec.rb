# frozen_string_literal: true

feature 'Visitor Visit Post Page' do
  scenario 'with successfully' do
    category = Category.create(name: 'Terror', color: 'danger')
    user = User.create(name: 'Marcus Pereira', email: 'marcus@git.com', password: '123')
    post = Post.create(
      title: 'Zelda é o melhor jogo para nintendo switch',
      content: 'Nintendo Switch em 2021',
      category: category,
      user: user
    )

    visit '/'
    click_on post.title

    expect(page).to have_content(post.title)
    expect(page).to have_content(post.content)
    expect(page).to have_content(post.category.name)
    expect(page).to have_content(post.status)
  end
end
