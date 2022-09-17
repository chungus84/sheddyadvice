Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  # Defines the root path route ("/")
  # root "articles#index"
  resources :posts do
    collection do
      get :top_rated
      get :recent
      get :trending
      get :house
      get :bathroom
      get :kitchen
      get :garden
    end
    member do
      resources :feedbacks
    end
  end

  resources :chatrooms do
    resources :messages
  end

  resources :listposts

  resources :lists

  # resources :chatrooms, only: :show do
  #   resources :messages, only: :create
  # end
end
