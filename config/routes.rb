Rails.application.routes.draw do
  devise_for :users

  devise_scope :user do
    authenticated :user do
      root to: "home#index", as: :authenticated_root
    end

    unauthenticated do
      root to: "devise/sessions#new", as: :unauthenticated_root
    end
  end

  resources :foods
  resources :recipes

  get 'public_recipes', to: 'recipes#public_recipes', as: 'public_recipes'
end
