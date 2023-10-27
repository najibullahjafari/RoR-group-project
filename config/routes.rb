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

  resources :recipe_foods

  get '/shopping_list', to: 'shopping_list#show'

  get 'general_shopping_list', to: 'shopping_list#index'
  get 'public_recipes', to: 'public_recipes#index', as: 'public_recipes'

  get 'new_food', to: 'foods#new', as: 'custom_new_food'
  get 'new_recipe', to: 'recipes#new', as: 'custom_new_recipe'

end
