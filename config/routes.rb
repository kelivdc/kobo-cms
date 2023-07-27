Rails.application.routes.draw do
  get 'about/index'
  namespace :cms do
    namespace :asset do
      get "detail/index"
    end
    get "participant/index"
    get "asset/index"
    get "dashboard", to: "dashboard#index"
    get "assets", to: "asset#index"
    get "assets/:uid", to: "asset#detail"
    get "participants", to: "participant#index"
  end
  namespace :dashboard do
    get "participant/index"
  end
  get "login", to: "login#index"
  get "logout", to: "login#logout"
  post "login", to: "login#login"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "home#index"
end
