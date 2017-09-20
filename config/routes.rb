Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.
  resources :home, only: :index
  scope :api do
    scope :v1 do
      resources :reminders
      resource :name , controller: :name
    end
  end
  root 'home#index'
end
