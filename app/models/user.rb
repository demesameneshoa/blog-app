class User < ApplicationRecord
  has_many :posts, foreign_key: 'author_id'
  has_many :comments
  has_many :likes
  attribute :posts_counter, :integer, default: 0
  after_save :update_user_posts_counter
  def three_most_recent_posts
    posts.order(created_at: :desc).limit(3)
  end

  def update_user_posts_counter
    update(posts_counter: posts.count)
  end
end
