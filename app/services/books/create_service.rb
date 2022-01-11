# frozen_string_literal: true

module Books
  class CreateService < BaseService
    def initialize(params = {})
      @params = params
    end

    def execute
      book = Book.new(@params)
      book.save
      if book.errors.any?
        return OpenStruct.new(
          success: false,
          record: book
        )
      elsif @params[:label_id].present?
        BooksLabel.create!(source_id: book.id, label_id: @params[:label_id])
      end

      OpenStruct.new(success: true, record: book)
    end
  end
end
