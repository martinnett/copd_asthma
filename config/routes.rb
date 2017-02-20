Rails.application.routes.draw do
  resources :patients do
    collection do
      get 'copd'
      get 'asthma'
    end
  end
  resources :users, only: [:index, :new, :create, :edit, :update]

  root    'home#index'
  get     'login', to: 'sessions#new'
  post    'login', to: 'sessions#create'
  delete  'logout', to: 'sessions#destroy'
end
