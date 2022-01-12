# frozen_string_literal: true

class BookResource < JSONAPI::Resource

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
