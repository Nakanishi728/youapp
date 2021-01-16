FactoryBot.define do
  factory :post do
    title { 'タイトル' }
    point { 'コンテンツ' }
    association :user
  end
end
