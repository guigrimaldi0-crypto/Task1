Rails.application.routes.draw do
  devise_for :users 

  root "veiculos#index"

  resources :veiculos

  resources :usuarios

end