Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations',
    sessions: 'users/sessions',
    # omniauth_callbacks: "users/omniauth_callbacks"
  }
  root "products#index"

  resources :users, only: %i(mypage show) do
    collection do
      get :logout
    end
  end

  resources :items, only: %i(index new destroy create)

  namespace :users do
    resources :user_details do
      collection do
        get :profile_edit
        get :credit_add
      end
    end
  end
end