Rails.application.routes.draw do
  root "pages#index"

  get "/about", to: "pages#about"
  get "/contact", to: "pages#contact"
  get "/sites", to: "sites#sites"

  resources :sites do
    resources :reservations
  end

  # get "/sites/:id/reservation", to: "reservation#new", as: "reservation"
end
