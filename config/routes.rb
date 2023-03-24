Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :health_check, only: :index
      resources :users, only: :destroy
      resources :sessions, only: :index
      resources :tasting_sheets, only: %i(index create destroy show update)
      resources :wines, only: %i(create destroy)
    end
  end
end
