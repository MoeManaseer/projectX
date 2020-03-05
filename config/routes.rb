Rails.application.routes.draw do
  root 'submissions#index'
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
  get 'userSub', to: 'submissions#userSub'
  get 'userCode', to: 'codes#userCode'
  resources :submissions
  resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
