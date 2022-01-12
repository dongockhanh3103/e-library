# frozen_string_literal: true

class SongResource < JSONAPI::Resource

  ATTRIBUTES = %i[
    id
    name
    description
    created_at
    updated_at
    label
  ].freeze

  attributes(*ATTRIBUTES)

end
