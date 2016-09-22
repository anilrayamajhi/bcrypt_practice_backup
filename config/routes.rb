Rails.application.routes.draw do

  root 'users#index'
  resources :users


  #Answer model embedded in questions
  # resources :questions do
  #   resources :answers
  # end
  # rake routes to view

  #sessions routes
  get '/logout' => 'sessions#destroy'
  resources :sessions, only: [:new, :create]
end
