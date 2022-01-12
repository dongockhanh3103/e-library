# frozen_string_literal: true

module Labels
  # Support for search label by book, song, combo
  class SearchLabelService < BaseService

    SEARCH_OPTIONS = %w[book song combo].freeze
    def initialize(params)
      @term = params[:term]
      @search_by = params[:search_by]
      super()
    end

    def execute
      if @search_by == 'combo'
        Combo.joins(:book, :song, :label).where(
          'lower(books.name) = ? OR lower(songs.name) = ?', @term.downcase, @term.downcase
        ).first&.label
      else
        klass = @search_by.classify.constantize

        klass.includes(:label).where('lower(name) = ?', @term.downcase).first&.label
      end
    end

  end
end
