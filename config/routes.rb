Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
    root 'products#index'
    devise_for :admins, controllers: {
      sessions:      'admins/sessions',
      passwords:     'admins/password',
      registrations: 'admins/registrations'
    }
    devise_for :end_users, controllers: {
      sessions:      'end_users/sessions',
      password:      'end_users/password',
      registrations: 'end_users/registrations'
    }
  namespace :admin do
    resources :end_users, only: [:index, :show, :edit, :update, :destroy] do
    resources :order_details, only: [:index]
    end
    resources :orders, only: [:index, :show, :update]

    resources :products, only: [:index, :show, :new, :edit, :create, :update, :destroy]
    resources :arrivals, only: [:index, :new, :edit, :create, :update, :destroy]
    resources :artists, only: [:new, :edit, :create, :update, :destroy]
    resources :labels, only: [:new, :edit, :create, :update, :destroy]
    resources :genres, only: [:new, :edit, :create, :update, :destroy]

    get  'top' => 'homes#top'
    get  'out/end_users/:id', to: 'end_users#out', as: :out
    get  'change' => 'order_details#change'
  end   
  resources :end_users, only: [:show, :edit, :destroy, :update] do 
    resources :addresses, only: [:create]
  end
  post '/orders/confirm', to: 'orders#before_confirm'
  get '/orders/confirm', to: 'orders#confirm', as: :confirm_order
  get '/orders/finish', to: 'orders#finish', as: :finish_order
  resources :orders, only: [:index, :show, :new, :create]
  resources :order_details, only: [:index]
  resources :cart_products, only: [:index, :update, :create, :destroy]
  resources :products, only: [:index, :show]
  get  'out' => 'end_users#out'
  
end
