Rails.application.routes.draw do
  root 'home#index'

  resources :users, only: [:index, :new, :create] do
    collection do
      post :login
    end
  end

  resources :copd_infos
end
