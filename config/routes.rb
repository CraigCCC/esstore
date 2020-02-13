Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'products#index'

  resources :products, only: [:index, :show]

  namespace :admin do
    root 'products#index' 
    resources :products do
      member do
        delete :destroy_image
      end
    end
  end
end
