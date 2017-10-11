Rails.application.routes.draw do

  post "/users/deleteprofilepic/:id" => "users#deleteprofile", as: :delete_profile_pic

   get '/AddFriend/:message/:friend' => 'posts#addfriend', as: :AddFriend
  get "/users/user_profile/:id" => "users#user_profile" 
  get 'user/user_API' => 'users#user_API'
  patch '/edituserform' => "users#editdone" , as: :edituser
  get '/editprofile' => 'users#edit'
  delete '/deletefriend/:id' => "posts#delfriend", as: :deletefriend
 
  post '/allusers' => 'posts#users' , as: :Alluser
  post '/like/toggle/:id/:type' => 'likes#toggle', as: :likeToggle
  get 'comments/create'

  get 'comments/destroy'

  devise_for :users, :controllers => { :omniauth_callbacks => "posts#index" }
  resources :posts, only: [:index, :create, :destroy]
  resources :comments, only: [:create, :destroy]

  root "posts#index"

  
end
