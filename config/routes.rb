Rails.application.routes.draw do
  resources :interest_relations
  resources :reply_likes
  resources :comment_likes
  resources :post_likes
  resources :replies
  resources :comments
  resources :posts
  resources :topics
  resources :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  post '/auth/login', to: 'auth#login'

  get '/posts/topic/:topic_id', to: 'posts#topic_posts'
  get '/interest_relations/matches/:id', to: 'interest_relations#get_matches'

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
end
