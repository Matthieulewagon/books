Rails.application.routes.draw do

  get 'facebookconnect/index'

  devise_for :users,
    controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  root to: 'pages#home'

  resources :users, only: [:show, :edit, :update] do
    resources :books, only: [] do
      resources :requests, only: [:new, :show, :create, :destroy]
    end

  end


  resources :books, only: [:show, :edit, :update, :new, :create, :index, :destroy] do
    #   get :autocomplete # <= add this line
    # end
  end

  resource :dashboard, only: [:show, :destroy]
end
