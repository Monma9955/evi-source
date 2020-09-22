Rails.application.routes.draw do
  root to: 'evidences#new'

  resources :evidences, only: [:create]
end
