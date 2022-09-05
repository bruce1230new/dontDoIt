Rails.application.routes.draw do
  root 'rooms#new'
  resources :rooms, only:[:show, :index, :new, :create, :destroy]
  resources :prohibited_actions, only:[:show, :index, :new, :create, :destroy]
end
