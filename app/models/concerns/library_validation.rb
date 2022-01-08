module LibraryValidation
  extend ActiveSupport::Concern
  include ActiveModel::Validations

  included do
    validates :name, length: { minimum: 1, maximum: 100 }, uniqueness: { case_sensitive: false }, presence: true
    validates :description, length: { minimum: 0, maximum: 200 }
  end
end
