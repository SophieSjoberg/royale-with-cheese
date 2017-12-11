Rails.application.routes.draw do

  devise_for :users
  root controller: :landing, action: :index
  post '/search', to: 'landing#search'
  post '/charges', to: 'charges#create'
end
