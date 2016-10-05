Rails.application.routes.draw do
  root 'api#index'
  devise_for :users

  resources :spectre_callbacks, :only => [] do
    collection do
      post :success, :fail
    end
  end

  get 'logins/after_redirect', :to => 'logins#after_redirect'

  authenticate :user do
    resources :accounts
    resources :logins
  end

end
