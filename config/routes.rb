Rails.application.routes.draw do
  
  devise_for :admins, controllers: {
  sessions:      'admins/sessions',
  passwords:     'admins/passwords',
  registrations: 'admins/registrations'
}
devise_for :customers, controllers: {
  sessions:      'publics/sessions',
  passwords:     'publics/passwords',
  registrations: 'publics/registrations'
}

  scope module: :publics do
    resources :homes, only: [:top,:about]
    resources :items, only: [:index,:show]
    resources :regstrations, only: [:new,:create]
    resources :sessions, only: [:new,:create,:destroy]
    resources :customers, only: [:show,:edit,:update,:confirm,:withdrawal]
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end