Rails.application.routes.draw do
  devise_for :users

  devise_scope :user do
    root to: "devise/sessions#new"
  end

  resources :foods
  resources :recipes

  get 'shopping_list', to: 'foods#shopping_list', as: 'shopping_list'
  get 'public_recipes', to: 'recipes#public_recipes', as: 'public_recipes'

end
