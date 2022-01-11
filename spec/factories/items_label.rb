# frozen_string_literal: true

FactoryBot.define do
  factory :items_label do
    source_id { nil }
    label

    trait :book do
      type { BooksLabel.class.name }
    end

    trait :song do
      type { SongsLabel.class.name }
    end

    trait :combo do
      type { CombosLabel.class.name }
    end
  end
end
