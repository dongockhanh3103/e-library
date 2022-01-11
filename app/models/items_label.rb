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
class ItemsLabel < ApplicationRecord

  after_create :clear_most_popular_cached

  validates :source_id, uniqueness: { scope: :type }

  def clear_most_popular_cached
    Rails.cache.delete(:most_popular_labels)
  end

end
