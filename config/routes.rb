# For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
Rails.application.routes.draw do
  get '/movies/index' => 'movies#index'
  get '/movies/new' => 'movies#new'
  post '/movies/create' => 'movies#create'
  delete '/movies/:id' => 'movies#destroy'
  get '/movies/:id/edit' => 'movies#edit'
  get '/movies/:id' => 'movies#show'
  put '/movies/:id' => 'movies#update'

  get '/watched_movies' => 'watched_movies#index'
  get '/watched_movies/new' => 'watched_movies#new'
  post '/watched_movies' => 'watched_movies#create'
  get '/watched_movies/:id/edit' => 'watched_movies#edit'
  put '/watched_movies/:id' => 'watched_movies#update'
  
  get '/wishlist_movies' => 'wishlist_movies#index'
  get '/wishlist_movies/new' => 'wishlist_movies#new'
  post 'wishlist_movies' => 'wishlist_movies#create'
  get '/wishlist_movies/:id' => 'wishlist_movies#show'
  put '/wishlist_movies/:id' => 'wishlist_movies#update'

  get '/users/new' => 'users#new'
  post '/users' => 'users#create'
  get '/users/:id' => 'users#show'
  get '/users/:id/edit' => 'users#edit'
  put '/users/:id' => 'users#update'

  get "/login" => "sessions#new"
  post "/login" => "sessions#create"
  get "/logout" => "sessions#destroy"

  get '/feeds' => 'feeds#index'

  # index
  # show
  # create
  # update
  # new
  # delete
  # edit
end
