Rails.application.routes.draw do
  


  root to: 'sites#index'

  get '/login' => 'session#new'
  post '/login' => 'session#create'
  delete '/login' => 'session#destroy'

  resources :sites, :photos, :reviews, :lists, :users, :stories

  get '/sites/:id/add_to_list' => 'sites#add_to_list', as:'add_to_list'

  post '/sites/:id/add_to_list' => 'sites#add_to_list_create'


  post '/search' => "pages#search"

end
