# frozen_string_literal: true

class CombosController < ApplicationController

  include ActsResource

  def create
    result = Combos::CreateService.execute(permitted_create_params)

    jsonapi_render(json:           result.record,
                   resource_class: @resource_class) && return if result.success

    render_jsonapi_error(result.record, http_status: 422)
  end

  private

  def set_resource_client
    @resource_client ||= Combo
  end

  def set_resource_class
    @resource_class ||= ComboResource
  end

  def includes_attributes
    %i[book song label]
  end

  def permitted_create_params
    params.require(:data).require(:attributes).permit(:book_id, :song_id, :label_id)
  end

end
