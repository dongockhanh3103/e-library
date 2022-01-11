FactoryBot.define do
  factory :song do
    name { Faker::Name.unique.name }
    description { Faker::Lorem.sentence }
    label
  end
end
