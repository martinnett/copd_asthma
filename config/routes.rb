Rails.application.routes.draw do
  resources :patients
  resources :users, only: [:index, :new, :create]

  root    'patients#index'
  get     'login', to: 'sessions#new'
  post    'login', to: 'sessions#create'
  delete  'logout', to: 'sessions#destroy'
end
