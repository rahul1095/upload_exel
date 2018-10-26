Rails.application.routes.draw do
require 'sidekiq/web'
# ...
root :to => "products#index"
mount Sidekiq::Web, at: '/sidekiq'
  resources :products do
  	collection do
    post 'import'
    end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
