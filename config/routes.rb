Rails.application.routes.draw do
  root "pages#index"

  get "/about", to: "pages#about"
  get "/contact", to: "pages#contact"
  get "/sites", to: "site#sites"

  get "/sites/:id/reservation", to: "reservation#new", as: "reservation"
end
