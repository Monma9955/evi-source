Rails.application.routes.draw do
  root to: 'evidences#new'

  resources :posts, only: [:index]
  resources :evidences, only: [:create, :show]
end
