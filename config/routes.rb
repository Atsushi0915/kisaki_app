Rails.application.routes.draw do
  root 'posts#top'

  get  'user_new',    to:  'users#new',    as:  'user_new'
  post 'user_create', to:  'users#create', as:  'user_create'
  get  'user_index',  to:  'users#index',  as:  'users_index'
  
  get  'login',  to:  'sessions#new',      as:  'login_form'
  post 'login',  to:  'sessions#create',   as:  'login'
  get  'logout', to:  'sessions#destroy',  as:  'logout'

  get  'post_new', to: 'posts#new', as: 'post_new'
  post 'post_create', to: 'posts#create', as: 'post_create'
  get  'posts_index', to: 'posts#index',  as: 'posts_index'
  
  
end
