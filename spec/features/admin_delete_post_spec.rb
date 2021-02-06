feature 'Admin delete post' do
  scenario 'with successfully', js: true do
    category = Category.create(name: 'Ação')
    user = User.create(name: 'Marcus Pereira',
                       email: 'preto@marcuspereira.xyz', password: '123456')
    post = Post.create(title: 'Playstation 5 custa 5k', content: 'lorem example im',
                       category: category, status: 'publicado', user: user)

    visit '/'
    click_button(id: "delete-#{post._id}")

    expect(page).not_to have_content('Playstation 5 custa 5k')
  end
end
