# frozen_string_literal: true

FactoryBot.define do
  factory :label do
    name { Faker::Name.unique.name }
    description { Faker::Lorem.sentence }
  end
end
