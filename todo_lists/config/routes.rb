Rails.application.routes.draw do
<<<<<<< HEAD
  resources :users
  resource :session

  resources :goals
  resources :comments 
=======
  namespace :api, default: {format: :json} do
    resources :todos, only: [:index, :create, :update, :destroy]
  end

  root to: 'static_pages#root'
>>>>>>> old_i/master
end
