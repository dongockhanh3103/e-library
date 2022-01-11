# frozen_string_literal: true

class BookResource < JSONAPI::Resource
  ATTRIBUTES = %i[
    name
    description
    created_at
    updated_at
    label
  ].freeze

  attributes(*ATTRIBUTES)
end
