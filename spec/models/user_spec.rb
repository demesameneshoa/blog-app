require 'rails_helper'

RSpec.describe User, type: :model do
  it { should validate_presence_of(:name) }
  it { should validate_numericality_of(:posts_counter).only_integer.is_greater_than_or_equal_to(0) }

  describe '#three_most_recent_posts' do
    it 'returns three most recent posts for the user' do
      user = create(:user)
      create_list(:post, 5, author: user)

      expect(user.three_most_recent_posts.length).to eq(3)
    end
  end
end
