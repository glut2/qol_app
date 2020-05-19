Rails.application.routes.draw do

  devise_for :users, only: [:sign_in, :sign_out, :session]
  namespace :admin do
    resources :users
  end

  root 'top#index'

  resources :questionnaires
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
