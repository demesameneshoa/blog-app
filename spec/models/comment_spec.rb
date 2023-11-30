require 'rails_helper'

RSpec.describe Comment, type: :model do
  describe 'associations' do
    it { should belong_to(:user) }
    it { should belong_to(:post) }
  end

  describe '#update_post_comments_counter' do
    it 'updates the post comments counter' do
      post = create(:post)
      create_list(:comment, 3, post: post)

      comment = create(:comment, post: post)
      comment.send(:update_post_comments_counter) # Access private method for testing

      expect(post.reload.comments_counter).to eq(4)
    end
  end
end
