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

  # config/routes.rb

  resources :foods do
    delete 'delete_food', on: :member   
  end
  resources :recipes

  get 'shopping_list', to: 'foods#shopping_list', as: 'shopping_list'
  get 'public_recipes', to: 'recipes#public_recipes', as: 'public_recipes'
end
