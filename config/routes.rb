Rails.application.routes.draw do

  match 'heart', to: 'hearts#heart', via: :post

  match 'unheart', to: 'hearts#unheart', via: :delete

  root 'posts#index'
  resources :sessions, only: [:new, :create]
  resources :posts do
    resources :comments
  end
  resources :users
  delete '/logout' => 'sessions#destroy', as: :logout

  post 'users/:id/new' => 'comments#create'

end
