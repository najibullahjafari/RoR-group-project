Rails.application.routes.draw do
  devise_for :users

  devise_scope :user do
    authenticated :user do
      root to: "recipes#index", as: :authenticated_root
    end

    unauthenticated do
      root to: "devise/sessions#new", as: :unauthenticated_root
    end
  end

  resources :foods
  resources :recipes, only: [:index, :create, :destroy]
  

  get 'public_recipes', to: 'public_recipes#index'
end
