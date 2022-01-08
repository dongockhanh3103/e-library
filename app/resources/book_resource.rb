class BookResource < JSONAPI::Resource
  ATTRIBUTES = %i[
    name
    description
    created_at
    updated_at
  ].freeze

  attributes(*ATTRIBUTES)
end
