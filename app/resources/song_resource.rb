class SongResource < JSONAPI::Resource
  ATTRIBUTES = %i[
    name
    description
    created_at
    updated_at
  ]

  attributes(*ATTRIBUTES)
end
