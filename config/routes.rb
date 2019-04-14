Rails.application.routes.draw do
  devise_for :users
  root 'products#index'
  resource :users, only: [:edit, :update]
  resource :mypage, only: [:index] do
    resource :profile, only: [:edit]
  end

end
