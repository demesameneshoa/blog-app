require 'rails_helper'

RSpec.describe Like, type: :model do
  describe 'associations' do
    it { should belong_to(:user) }
    it { should belong_to(:post) }
  end

  describe '#update_post_likes_counter' do
    it 'updates the post likes counter' do
      post = create(:post)
      create_list(:like, 3, post:)

      like = create(:like, post:)
      like.send(:update_post_likes_counter) # Access private method for testing

      expect(post.reload.likes_counter).to eq(4)
    end
  end
end
