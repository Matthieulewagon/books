Rails.application.routes.draw do


  devise_for :users
  root to: 'pages#home'

  resources :users, only: [:show, :edit, :update] do
    resources :books, only: [:destroy]
  end

  resources :books, only: [:show, :edit, :update, :new, :create, :index]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
