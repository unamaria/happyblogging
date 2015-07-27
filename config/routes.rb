Rails.application.routes.draw do
  root to: 'home#index'
  devise_for :users, :controllers => { registrations: 'registrations' }
  get 'users/profile/:handle' => 'users#show', as: 'user'
  get ':handle' => 'posts#index'


  resources :users, only: [] do
  	resources :posts 
  end
end
