Rails.application.routes.draw do

  get '/' => 'pages#index'
  post '/search' => 'pages#search'

end
