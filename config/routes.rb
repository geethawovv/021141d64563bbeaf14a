Rails.application.routes.draw do
  namespace :api do
    get 'users'=> 'users#index'
    get 'user/:id'=> 'users#show'
    post 'user'=> 'users#create'
    put 'user/:id'=> 'users#update'
    delete 'user/:id'=> 'users#destroy'
    get 'typeahead/:input'=> 'users#index'
  end
end
