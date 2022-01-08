# frozen_string_literal: true

# Init Song labels
labels = %i[
  rock
  pop
  jazz
  hip_hop
  folk
  classical
  heavy_metal
  country
  soul
  electronic
  romance
  action
  comedy
  horror
  fantasy
  murder
  spy
  fiction
  dramma
  graphic_novel
]

labels.each do |label|
  Label.create(name: label, description: Faker::Lorem.sentence)
end
