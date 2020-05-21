Rails.application.routes.draw do

  devise_for :users, only: [:sign_in, :sign_out, :session]

  namespace :manager do
    get "questionnaires/manage" => "questionnaires#manage"
  end

  namespace :admin do
    resources :users
    resources :departments
    get "questionnaires/administrate" => "questionnaires#administrate"
    resources :questionnaires, only: [:show, :edit, :update, :destroy]
  end

  resources :questionnaires, only: [:index, :new, :create]

  root 'top#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
