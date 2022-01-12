# frozen_string_literal: true

class ComboResource < JSONAPI::Resource

  ATTRIBUTES = %i[
    id
    book
    song
    label
    created_at
    updated_at
  ].freeze

  attributes(*ATTRIBUTES)

end
