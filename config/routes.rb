Rails.application.routes.draw do
  root to: 'home#index'
  devise_for :users
  get 'users/profile/:handle' => 'users#show', as: 'user'
  get ':handle' => 'posts#index'
  get ':handle/posts/new' => 'posts#new', as: 'new_post' # nest posts to handle?
  post ':handle/posts' => 'posts#create'
  get ':handle/posts/:post_id' => 'posts#show', as: 'post'
end
