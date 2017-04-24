Rails.application.routes.draw do

  root 'posts#index'
  resources :sessions, only: [:new, :create]
  resources :posts
  resources :users
  delete '/logout' => 'sessions#destroy', as: :logout

end
