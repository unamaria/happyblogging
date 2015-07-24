Rails.application.routes.draw do
  root to: 'home#index'
  devise_for :users
  get 'users/profile/:handle' => 'users#show', as: 'user'
end
