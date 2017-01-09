Rails.application.routes.draw do

  devise_for :users
  root to: 'pages#home'

  resources :users, only: [:show, :edit, :update] do
    resources :books, only: [] do
      resources :requests, only: [:new, :show, :create, :destroy]
    end

  end



  resources :books, only: [:show, :edit, :update, :new, :create, :index] do
    #   get :autocomplete # <= add this line
    # end
  end

  resource :dashboard, only: [:show, :destroy]
end
