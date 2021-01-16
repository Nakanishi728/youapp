FactoryBot.define do
  factory :pickup do
    association :post
    user { post.user }
  end
end
