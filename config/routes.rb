Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root 'lists#index'
  resources :lists, only: %i[new index show destroy create] do
    resources :bookmarks, only: %i[destroy create]
  end
  resources :movies, only: %i[index]
end
