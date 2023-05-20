Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  get 'home/index'
  devise_for :profiles, controllers: {
    registrations: 'profiles/registrations'
  }
  resources :doctors, only: %i[index show]
  resources :doctor_users, only: %i[index create update]
  resources :profiles do
    get :my_profile, on: :collection
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  root to: 'home#index'
end
