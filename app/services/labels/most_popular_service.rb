# frozen_string_literal: true

module Labels
  class MostPopularService < BaseService

    MOST_POPULAR_NUMBER = 10

    def execute
      Rails.cache.fetch(:most_popular_labels, expires_in: 30.minutes) do
        Label.where(id: most_popular_label_ids)
      end
    end

    private

    def most_popular_label_ids
      @popular_item_ids ||= ItemsLabel.group(:label_id).
                                      order(count_id: :desc).
                                      count(:id).keys.first(MOST_POPULAR_NUMBER)
    end

  end
end
