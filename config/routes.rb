Rails.application.routes.draw do
  devise_for :users

  root "pages#index"

  # Static pages
  get "/rules", to: "pages#rules"
  get "/contact", to: "pages#contact"
  get "/sites", to: "sites#sites"
  
  # Admin page (TODO: Maybe move from pages to its own controller?)
  get "/admin", to: "pages#admin"

  resources :sites do
    resources :reservations
  end
end
