feature 'Admin' do
  background do
    Capybara.app = PostController
  end
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
end