Rails.application.routes.draw do
  root 'static_pages#home'

 resources :list_items

 get '/congrats', to: 'static_pages#congrats'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
