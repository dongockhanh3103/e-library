# frozen_string_literal: true

# == Schema Information
#
# Table name: items_labels
#
#  id         :bigint           not null, primary key
#  source_id  :bigint           not null
#  label_id   :bigint
#  type       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class SongsLabel < ItemsLabel
end
