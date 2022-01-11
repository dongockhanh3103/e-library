# frozen_string_literal: true

module Combos
  class CreateService < BaseService

    def initialize(params = { })
      @params = params
    end

    def execute
      combo = Combo.new(@params)
      combo.save
      if combo.errors.any?
        return OpenStruct.new(
          success: false,
          record:  combo
        )
      elsif @params[:label_id].present?
        CombosLabel.create!(source_id: combo.id, label_id: @params[:label_id])
      end

      OpenStruct.new(success: true, record: combo)
    end

  end
end
