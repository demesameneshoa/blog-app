require 'rails_helper'

RSpec.describe Post, type: :model do
  it { should validate_presence_of(:title) }
  it { should validate_length_of(:title).is_at_most(250) }
  it { should validate_numericality_of(:comments_counter).only_integer.is_greater_than_or_equal_to(0) }
  it { should validate_numericality_of(:likes_counter).only_integer.is_greater_than_or_equal_to(0) }

  describe '#five_most_recent_comments' do
    it 'returns five most recent comments for the post' do
      post = create(:post)
      create_list(:comment, 7, post:)

      expect(post.five_most_recent_comments.length).to eq(5)
    end
  end
end
