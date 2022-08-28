Rails.application.routes.draw do
  

  root to: 'pages#home'
  resources :sites, :photos, :reviews
end
