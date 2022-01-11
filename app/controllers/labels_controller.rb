# frozen_string_literal: true

class LabelsController < ApplicationController

  include ActsResource

  def most_popular
    jsonapi_render(json: Labels::MostPopularService.execute, resource_class: @resource_class)
  end

  def search
    jsonapi_render(json:           Labels::SearchLabelService.execute(permitted_search_params),
                   resource_class: @resource_class)
  end

  private

  def set_resource_client
    @resource_client ||= Label
  end

  def set_resource_class
    @resource_class ||= LabelResource
  end

  def filter_attributes
    [:name]
  end

  def permitted_search_params
    params.require(:data).require(:attributes).permit(:search_by, :term)
  end

end
