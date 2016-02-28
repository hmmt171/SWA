Rails.application.routes.draw do
  devise_for :users, :controllers => {
    :omniauth_callbacks => "users/omniauth_callbacks"
  }

  root 'contents#index'
  resources :contents, only: [:show, :new, :create, :index] do
    collection do
      get 'search'
    end
  end
end
