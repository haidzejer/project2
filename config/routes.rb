Rails.application.routes.draw do

  root 'posts#index'
  resources :sessions, only: [:new, :create]
  resources :posts do
    resources :comments
  end
  resources :users
  delete '/logout' => 'sessions#destroy', as: :logout

  post 'users/:id/new' => 'comments#create'

end
