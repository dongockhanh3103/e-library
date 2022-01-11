# frozen_string_literal: true

module JsonApiRenderer
  def jsonapi_render(json:, resource_class:, status: nil, options: {})
    body = json.nil? ? { data: nil } : jsonapi_format(json, options, resource_class)
    render json: body, status: (status || :ok)
  rescue StandardError => e
    Rails.logger.error "Backtrace:\n\t#{e.backtrace.join("\n\t")}"
    p e
    # raise_errors('unexpected_error', 'jsonapi_render', 500, ex.to_s)
  end

  def render_jsonapi_error(object, http_status: 422)
    errors = object.respond_to?(:errors) ? object.errors : object
    errors = format_active_model_errors(errors, object.class.name)
    error_body = error_sanitize(errors).uniq
    render json: { errors: error_body }, status: http_status
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

  def error_sanitize(errors)
    Array(errors).map do |error|
      %i[title detail id code source links status meta].reduce({}) do |sum, key|
        value = error.try(key) || error.try(:[], key)
        if value.nil?
          sum
        else
          value = value.to_s if key == :code
          sum.merge(key => value)
        end
      end
    end
  end

  def format_active_model_errors(errors, object_name, http_status: 422)
    return errors unless errors.is_a? ActiveModel::Errors

    errors.map do |error_key, error_message|
      {
        title: error_message,
        detail: error_message,
        code: "#{object_name}##{error_key}",
        source: {
          pointer: "#{controller_path}/#{action_name}"
        },
        status: http_status
      }
    end
  end
end
