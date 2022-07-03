Rails.application.routes.draw do
  devise_for :customers, controllers: {
  sessions:      'publics/sessions',
  passwords:     'publics/passwords',
  registrations: 'publics/registrations'
  }
  
  devise_for :admins, controllers: {
  sessions:      'admins/sessions',
  passwords:     'admins/passwords',
  registrations: 'admins/registrations'
  }
  scope module: :publics do
    resources :items, only: [:index,:show]
    delete 'cart_items/destroy_all' =>'cart_items#destroy_all'
    resources :cart_items, only: [:index,:update,:destroy,:create]
    resources :orders, only: [:new,:top,:create,:index,:show]
    resources :addresses, only: [:index,:edit,:create,:update,:destroy]
    get 'about' => 'homes#about'
    root 'homes#top'
    get 'customers/mypage' => 'customers#show'
    get 'customers/information/edit' => 'customers#edit'
    patch 'customers/customers/infomation' => 'customers#update'
    get 'customers/withdrawal' =>'customers#withdrawal'
    get 'customers/confirm' => 'customers#confirm'
    post 'orders/confirm' => 'order#confirm'
  end
  

  namespace :admins do
   resources :items, only: [:index, :show, :new, :create, :edit, :update]
   resources :genres, only: [:index,:create,:edit,:update]
   resources :customers, only: [:index,:show,:edit,:update]
   resources :order_details, only: [:show,:update]
   resources :orders, only: [:update]
   get 'top' => 'homes#top'
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end