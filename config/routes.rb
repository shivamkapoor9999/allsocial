Rails.application.routes.draw do
  delete '/deletefriend/:id' => "posts#delfriend"
  post '/AddFriend/:friend' => 'posts#addfriend', as: :AddFriend
  post '/allusers' => 'posts#users' , as: :Alluser
  post '/like/toggle/:id/:type' => 'likes#toggle', as: :likeToggle
  get 'comments/create'

  get 'comments/destroy'

  devise_for :users
  resources :posts, only: [:index, :create, :destroy]
  resources :comments, only: [:create, :destroy]

  root "posts#index"
end
