Rails.application.routes.draw do

  get 'messages/create'

  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }

  resources :comments, only: [:create]

  post 'upload_images/create/:post_id' => 'upload_images#create', as: :upload_image

  post "/users/deleteprofilepic/:id" => "users#deleteprofile", as: :delete_profile_pic

   get '/AddFriend/:message/:friend' => 'posts#addfriend', as: :AddFriend
   get '/user/user_API' => 'users#user_API'
  get "/users/user_profile/:id" => "users#user_profile" 
  
  patch '/edituserform' => "users#editdone" , as: :edituser
  get '/editprofile' => 'users#edit'
  delete '/deletefriend/:id' => "posts#delfriend", as: :deletefriend
 
  get '/allusers' => 'posts#users' , as: :Alluser
  post '/like/toggle/:id/:type' => 'likes#toggle', as: :likeToggle
  get 'comments/create'

  get 'comments/destroy'

 
  resources :posts, only: [:index, :create, :destroy]
  resources :comments, only: [:create, :destroy]

  root "posts#index"
  
 
  
end
