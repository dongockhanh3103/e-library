# frozen_string_literal: true

FactoryBot.define do
  factory :book do
    name { Faker::Name.unique.name }
    description { Faker::Lorem.sentence }
    label
  end
end
