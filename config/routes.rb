Rails.application.routes.draw do
  devise_for :users
  get '/', to: 'users#index', as: 'user_index'
  get '/users/new_post', to: 'posts#new', as: 'create_new_post'
  post '/users/new_post', to: 'posts#create'
  delete '/users/:author_id/posts/:post_id/delete_post', to: 'posts#destroy'
  get '/users/:post_id/new_comment', to: 'comments#new', as: 'create_new_comment'
  post '/users/:post_id/new_comment', to: 'comments#create'
  delete '/users/:post_id/delete_comment/:comment_id', to: 'comments#destroy'
  get '/users/:author_id', to: 'users#show', as: 'users_show'
  get '/users/:author_id/posts', to: 'posts#index', as: 'posts_index'
  get '/users/:author_id/posts/:post_id', to: 'posts#show', as: 'posts_show'
  get '/users/:author_id/posts/:post_id/liked_post', to: 'posts#like'
end
