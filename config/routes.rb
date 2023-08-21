Rails.application.routes.draw do
  devise_for :users

  root "pages#index"

  # Static pages
  get "/rules", to: "pages#rules"
  get "/contact", to: "pages#contact"
  get "/sites", to: "sites#sites"
  
  # Admin page
  get "/admin", to: "admin#admin"
  # TODO: This is a prototype, fix this
  get "/admin/new", to: "admin#new"
  post "/admin/new", to: "admin#create"
  get "/admin/edit/:id", to: "admin#edit", as: "admin_edit"
  put "/admin/edit/:id", to: "admin#update"
  delete "/admin/destroy/:id", to: "admin#destroy", as: "admin_destroy"

  resources :sites do
    resources :reservations
  end
end
