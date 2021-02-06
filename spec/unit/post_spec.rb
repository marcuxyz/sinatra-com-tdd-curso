# frozen_string_literal: true

describe 'Post Model'  do
  it 'create new post' do
    category = Category.create(
      name: 'FPS'
    )
    user = User.create(
      name: 'Marcus Pereira',
      email: 'preto@marcuspereira.xyz',
      password: '123456'
    )
    post = Post.new(
      title: 'novo mapa de call of duty é lançado',
      content: 'o map caspin berry foi adaptado para o novo cold war',
      status: 'publicado',
      category: category,
      user: user
    )

    post.save!

    expect(post.title).to eq('novo mapa de call of duty é lançado')
    expect(post.content).to eq('o map caspin berry foi adaptado para o novo cold war')
    expect(post.status).to eq('publicado')
    expect(post.category.name).to eq('FPS')
  end
end
