Rails.application.routes.draw do
  resources :users,  only: [:index, :show, :create, :destroy, :update] do
    resources :comments, only: [:index, :show, :create, :destroy, :update]
  end
  resources :contacts,  only: [:show, :create, :destroy, :update] do
    resources :comments, only: [:index, :show, :create, :destroy, :update]
  end

  resources :contact_shares,  only: [:index, :show, :create, :destroy, :update]
  get "/users/:user_id/contacts", to: "contacts#index"

  resources :groups, only: [:index, :show, :create, :destroy, :update]
  resources :group_joins, only: [:index, :show, :create, :destroy, :update]
  resources :favorites, only: [:index, :show, :create, :destroy, :update]

end
