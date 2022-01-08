Rails.application.routes.draw do
  api_version(
    module: 'V1', path: { value: 'v1' },
    defaults: { format: :json }
  ) do
    resources :books, only: %i[index show create]
    resources :songs, only: %i[index show create]
    resources :labels, only: %i[index show create] do
      get :most_popular, on: :collection
    end
  end
end