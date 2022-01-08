module JsonApiRenderer
  def jsonapi_render(json:, resource_class:, status: nil, options: {})
    body = json.nil? ? { data: nil } : jsonapi_format(json, options, resource_class)
    render json: body, status: (status || :ok)
  rescue StandardError => e
    Rails.logger.error "Backtrace:\n\t#{e.backtrace.join("\n\t")}"
    p e
    # raise_errors('unexpected_error', 'jsonapi_render', 500, ex.to_s)
  end

  private

  def jsonapi_format(object, options, resource_class)
    opts = @params_parser ? apply_params_parser : {}
    opts.merge!(opts)

    serializer = JSONAPI::ResourceSerializer.new(resource_class, opts)
    resource = if object.respond_to?(:to_ary)
                 object.map do |obj|
                   resource_class.new(obj, {})
                 end
               else
                 resource_class.new(object, {})
               end

    result = serializer.serialize_to_hash(resource)

    result.merge!(meta: options[:top_level_meta]) if options[:top_level_meta].present?

    result
  end
end
