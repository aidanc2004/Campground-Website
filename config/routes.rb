Rails.application.routes.draw do
  devise_for :users
  root "pages#index"

  # Static pages
  get "/rules", to: "pages#rules"
  get "/contact", to: "pages#contact"
  get "/sites", to: "sites#sites"

  resources :sites do
    resources :reservations
  end
end
