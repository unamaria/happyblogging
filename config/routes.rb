Rails.application.routes.draw do
  root to: 'home#index'
  devise_for :users, :controllers => { registrations: 'registrations' }
  get 'users/profile/:handle' => 'users#show', as: 'user'
  get 'users/profile/:handle/style' => 'users#edit', as: 'user_edit'
  put 'users/profile/:handle' => 'users#update'
  post 'users/profile/:handle' => 'users#sync_data', as: 'user_sync_data'
  get ':handle' => 'blog_items#index', as: 'user_index'

  resources :users, only: [] do
  	resources :post_items
  	resources :flickr_items
  	resources :medium_items
  	resources :flickr_details, except: [:index, :show]
  	resources :medium_details, except: [:index, :show]
  end

  resources :post_items, :medium_items, :flickr_items, only: [] do
  	resources :comments, only: [:create]
  end
end
