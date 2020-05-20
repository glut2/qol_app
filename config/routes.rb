Rails.application.routes.draw do

  namespace :admin do
    resources :users
  end

  devise_for :users
  root 'top#index'

  resources :questionnaires
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
