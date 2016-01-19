Rails.application.routes.draw do

  root 'static#home'

  get 'entry/list'

  get 'entry/show'

  get 'entry/create'

  get 'entry/edit'

  get 'entry/delete'

  get 'entry/new'

  get 'static/home'

  get 'static/about'

end
