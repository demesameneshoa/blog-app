require 'rails_helper'

RSpec.describe 'UsersController', type: :request do
  it 'renders the index page' do
    get '/users'
    expect(response).to have_http_status(200)
    expect(response).to render_template(:index)
    expect(response.body).to include('All Users Page')
  end

  it 'renders the show page' do
    user = create(:user)
    get "/users/#{user.id}"
    expect(response).to have_http_status(200)
    expect(response).to render_template(:show)
    expect(response.body).to include('Single User Page')
  end
end
