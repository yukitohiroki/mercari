Rails.application.routes.draw do
  devise_for :users
  root 'products#index'

  resource :users, only: [:edit, :update] do
    get '/logout', to:'users#logout'
  end

  get '/mypage', to: 'mypage#index'
  resource :mypage, only: [:index] do
    resource :profile, only: [:edit]
  end

end
