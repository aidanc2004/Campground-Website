Rails.application.routes.draw do
  root "pages#index"

  # Static pages
  get "/rules", to: "pages#rules"
  get "/contact", to: "pages#contact"
  get "/sites", to: "sites#sites"

  resources :sites do
    resources :reservations
  end
end
