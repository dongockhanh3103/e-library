# frozen_string_literal: true

module Songs
  # Create new Song with label
  class CreateService < BaseService

    def initialize(params = { })
      super()
      @params = params
    end

    def execute
      song = Song.new(@params)
      song.save
      if song.errors.any?
        return OpenStruct.new(
          success: false,
          record:  song
        )
      elsif @params[:label_id].present?
        SongsLabel.create!(source_id: song.id, label_id: @params[:label_id])
      end

      OpenStruct.new(success: true, record: song)
    end

  end
end
