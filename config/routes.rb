Rails.application.routes.draw do
  get 'forecasts/index'

  resources :locations, only: [:create]

  root to: 'forecasts#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
