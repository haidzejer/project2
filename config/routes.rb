Rails.application.routes.draw do

  root 'posts#index'
  resources :sessions, only: [:new, :create]
  resources :posts
  resources :users
  resources :comments
  delete '/logout' => 'sessions#destroy', as: :logout

end
