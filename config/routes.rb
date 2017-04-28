Rails.application.routes.draw do
  get 'forecasts/index'

  root to: 'forecasts#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
