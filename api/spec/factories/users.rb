FactoryBot.define do
  factory :user do
    name { Faker::Name.name }
    email { Faker::Internet.unique.email }
    profile { Faker::Lorem.sentence }
    uid { 'gyuixaysg78' }
  end
end
