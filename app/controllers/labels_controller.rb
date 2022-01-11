# frozen_string_literal: true

class LabelsController < ApplicationController
  include ActsResource

  def most_popular
    jsonapi_render(json: Labels::MostPopularService.execute, resource_class: @resource_class)
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
end
