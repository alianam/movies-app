Rails.application.routes.draw do
  get '/movies/index' => 'movies#index'
  get '/movies/new' => 'movies#new'
  post '/movies/create' => 'movies#create'
  delete '/movies/:id' => 'movies#destroy'
  get '/movies/:id/edit' => 'movies#edit'
  get '/movies/:id' => 'movies#show'
  put '/movies/:id' => 'movies#update'
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
  # index
  # show
  # create
  # update
  # new
  # delete
  # edit
end
