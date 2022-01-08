class SongsController < ApplicationController
  include ActsResource

  private

  def set_resource_client
    @resource_client ||= Song
  end

  def set_resource_class
    @resource_class ||= SongResource
  end

  def filter_attributes
    [:name]
  end
end
