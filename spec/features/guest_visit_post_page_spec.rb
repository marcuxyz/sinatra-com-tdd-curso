# frozen_string_literal: true

feature 'Guest visit post page' do
  scenario 'with sucessfully' do
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
  end
end
