Rails.application.routes.draw do
  root "home#index"

  resources :feeds do
    resources :entries, only: :show
  end
end
