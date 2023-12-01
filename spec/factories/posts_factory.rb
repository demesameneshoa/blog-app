FactoryBot.define do
  factory :post do
    title { 'Sample Title' }
    text { 'This is sample text' }
    association :author, factory: :user_with_posts
  end

  factory :user_with_posts, parent: :user do
    transient do
      posts_count { 1 }
    end

    after(:create) do |user, evaluator|
      create_list(:post, evaluator.posts_count, author: user)
    end
  end
end
