Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.
  resources :home, only: :index
  scope :api do
    scope :v1 do
      resources :reminders
    end
  end
  root 'home#index'
end
