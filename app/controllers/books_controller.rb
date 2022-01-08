class BooksController < ApplicationController
  include ActsResource

  def create; end

  private

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
