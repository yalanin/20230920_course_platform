Rails.application.routes.draw do
  devise_for :admins
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  root to: "courses#index"

  resources :courses do
    get :details
  end
end
