Rails.application.routes.draw do
  resources :patients
  root 'patients#index'

  resources :users, only: [:index, :new, :create] do
    collection do
      post :login
    end
  end

end
