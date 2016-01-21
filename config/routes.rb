Rails.application.routes.draw do

  root 'static#home'

  # Users
  resources :users do
    collection do
      get 'login'
      post 'login'
    end

    member do
      post 'logout'
    end
  end

  # Entries
  resources :entries do

  end

  # Static
  get 'static/home'
  get 'static/about'

end
