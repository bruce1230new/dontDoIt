Rails.application.routes.draw do
  root 'players#new'
  resources :rooms, only:[:show, :index, :new, :create, :destroy]
  resources :prohibited_actions, only:[:show, :index, :new, :create, :destroy]
  resources :players, only:[:show, :index, :new, :create, :update, :destroy]
end
