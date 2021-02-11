# frozen_string_literal: true

feature 'Admin Delete Post', js: true do
  scenario 'with successfully' do
    category = Category.create(name: 'Terror', color: 'danger')
    user = User.create!(name: 'Marcus', email: 'marcus@git.com', password: '123456')
    post = Post.create(
      title: 'Zelda é o melhor jogo para nintendo switch',
      content: 'Nintendo Switch em 2021',
      category: category,
      user: user
    )

    visit '/'
    click_on 'Entrar'

    fill_in 'Email', with: 'marcus@git.com'
    fill_in 'Senha', with: '123456'
    click_on 'Acessar'

    click_button(id: "delete-#{post.id}")

    expect(page).not_to have_content(post.title)
  end
end
