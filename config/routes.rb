Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :users, only: :destroy
      resources :sessions, only: :index
      resources :tasting_sheets, only: %i(index create)
    end
  end
end
