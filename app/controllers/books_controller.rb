# frozen_string_literal: true

class BooksController < ApplicationController

  include ActsResource

  def create
    result = Books::CreateService.execute(permitted_create_params)

    jsonapi_render(json:           result.record,
                   resource_class: @resource_class) && return if result.success

    render_jsonapi_error(result.record, http_status: 422)
  end

  private

  def includes_attributes
    :label
  end

  def set_resource_client
    @resource_client ||= Book
  end

  def set_resource_class
    @resource_class ||= BookResource
  end

  def filter_attributes
    [:name]
  end

  def permitted_create_params
    params.require(:data).require(:attributes).permit(
      :name,
      :description,
      :label_id
    )
  end

end
