Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :list do
    resources :list_items
  end

  root "lists#index"

end
