Rails.application.routes.draw do
  get 'sessions/create'

  get 'sessions/destroy'

  get 'home/show'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.
  resources :home, only: :index
  scope :api do
    scope :v1 do
      resources :reminders
    end
  end
  root 'home#index'

  # google authentication
  get 'auth/:provider/callback', to: 'sessions#create'
  get 'auth/failure', to: redirect('/')
  get 'signout', to: 'sessions#destroy', as: 'signout'

  resources :sessions, only: [:create, :destroy]
  resource :home, only: [:show]

end

