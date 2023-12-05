require 'rails_helper'

RSpec.describe 'PostsController', type: :request do
  it 'renders the posts index page for a user' do
    user = create(:user)
    get "/users/#{user.id}/posts"
    expect(response).to have_http_status(200)
    expect(response).to render_template(:index)
    expect(response.body).to include('All Posts Page')
  end

  it 'renders the posts show page for a selected post' do
    user = create(:user)
    post = create(:post, author: user)
    get "/users/#{user.id}/posts/#{post.id}"
    expect(response).to have_http_status(200)
    expect(response).to render_template(:show)
    expect(response.body).to include('Single Post Page')
  end
end
