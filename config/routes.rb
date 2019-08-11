Rails.application.routes.draw do
  get 'trash/index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :lists do
    match 'vanish', to: 'lists#vanish', via: [:post]
    resources :list_items do
      match 'vanish', to: 'list_items#vanish', via: [:post]
    end
  end

  root "lists#index"

end
