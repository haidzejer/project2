Rails.application.routes.draw do

  get '/star' => 'stars#star', as: :star
  get '/star' => 'stars#unstar', as: :unstar

  root 'posts#index'
  resources :sessions, only: [:new, :create]
  resources :posts do
    resources :comments
  end
  resources :users
  delete '/logout' => 'sessions#destroy', as: :logout

  post 'users/:id/new' => 'comments#create'

end
