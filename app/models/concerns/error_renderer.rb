# frozen_string_literal: true

module ErrorRenderer

  extend ActiveSupport::Concern

  def formatted_errors
    errors.errors.map do |error|
      {
        source:  self.class.name,
        message: "#{error.attribute.to_s.capitalize} #{error.message}"
      }
    end
  end

end
