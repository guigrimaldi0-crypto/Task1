Rails.application.routes.draw do
  devise_for :users

  root "veiculos#index"

  resources :veiculos

end