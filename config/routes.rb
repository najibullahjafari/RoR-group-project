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

  resources :foods do
    delete 'delete_food', on: :member
  end




  resources :recipes do
  member do
    patch 'toggle_privacy'
  end
end

  get 'shopping_list', to: 'foods#shopping_list', as: 'shopping_list'
  get 'public_recipes', to: 'recipes#public_recipes', as: 'public_recipes'

  get 'new_food', to: 'foods#new', as: 'custom_new_food'
  get 'new_recipe', to: 'recipes#new', as: 'custom_new_recipe'
end
