require 'rails_helper'

RSpec.describe Post, type: :system do
  describe 'user index page' do
    before(:each) do
      @users = create_list(:user, 5)
      visit users_path
    end
    # I can see the username of all other users.
    it 'displays the username of all other users' do
      @users.each do |user|
        expect(page).to have_content(user.name)
      end
    end
    # I can see the profile picture for each user.
    it 'displays the profile pictures of the users' do
      @users.each do |user|
        expect(page).to have_css("img[src*='#{user.photo}']")
      end
    end
    # I can see the number of posts each user has written.
    it 'displays the number of posts each user has written' do
      @users.each do |user|
        expect(page).to have_content(user.posts_counter)
      end
    end
  end
  describe 'when a user is clicked' do
    # I can click on a user's name to go to their show page.
    it 'it should redirects to that users show page' do
      # ? Factory Bot creates 5 users, so we need to take one of them to test. since all o them share
      # ? the same data (e.g. name).
      user = create(:user) # ! so just create a brand new one otherwise we get 'ambiguous match' error.
      visit users_path
      click_link user.name
      expect(page).to have_current_path(user_path(user))
    end
  end
end
