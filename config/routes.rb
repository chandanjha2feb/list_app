Rails.application.routes.draw do
  get 'trash/index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :lists do
    match 'vanish', to: 'lists#vanish', via: [:post]
    resources :list_items do
    end
  end
  post "/list_items/:list_item_id/vanish(.:format)" => "list_items#vanish", as: 'item_vanish'
  root "lists#index"

end
