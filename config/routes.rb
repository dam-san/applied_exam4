Rails.application.routes.draw do

  get 'book_comments/create'
  get 'book_comments/destroy'
  get 'favorites/destroy'
  get 'favorites/create'
   get 'home/about' => 'homes#about'
  root 'homes#top'



  devise_for :users
  resources :users,only: [:show,:index,:edit,:update]

  resources :books do
    resource :favorites, only: [:create, :destroy]
    resources :book_comments, only: [:create, :destroy]
  end


end