# frozen_string_literal: true

class SongResource < JSONAPI::Resource
  ATTRIBUTES = %i[
    name
    description
    created_at
    updated_at
    label
  ].freeze

  attributes(*ATTRIBUTES)
end
