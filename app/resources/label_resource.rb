# frozen_string_literal: true

class LabelResource < JSONAPI::Resource

  ATTRIBUTES = %i[
    id
    name
    description
    created_at
    updated_at
  ].freeze

  attributes(*ATTRIBUTES)

end
