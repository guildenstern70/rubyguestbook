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

  # Entry
  get 'entry/list'
  get 'entry/show'
  get 'entry/create'
  get 'entry/edit'
  get 'entry/delete'
  get 'entry/new'

  # Static
  get 'static/home'
  get 'static/about'

end
