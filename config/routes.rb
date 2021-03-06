Rails.application.routes.draw do

  resources :tenants do
    resources :condominios
    resources :tipo_fornecedors
    resources :fornecedors
    resources :tipo_despesas
    resources :despesas
    resources :forma_pagamentos
    resources :income_tipes
    resources :apartments
    resources :incomes
  end

  resources :condominios do
    resources :despesas
    resources :apartments
    resources :incomes
  end

  resources :members
  get 'home/index'

   root :to => "home#index"


  # *MUST* come *BEFORE* devise's definitions (below)
  as :user do
    match '/user/confirmation' => 'confirmations#update', :via => :put, :as => :update_user_confirmation
  end

  devise_for :users, :controllers => {
    :registrations => "milia/registrations",
    :confirmations => "confirmations",
    :sessions => "milia/sessions",
    :passwords => "milia/passwords",
  }


  devise_for :models
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
