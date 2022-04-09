Rails.application.routes.draw do
  get 'comments/new'
  root 'posts#top'

  get  'user_new',    to:  'users#new',    as:  'user_new'
  post 'user_create', to:  'users#create', as:  'user_create'
  get  'user_index',  to:  'users#index',  as:  'users_index'
  
  get  'login',  to:  'sessions#new',      as:  'login_form'
  post 'login',  to:  'sessions#create',   as:  'login'
  get  'logout', to:  'sessions#destroy',  as:  'logout'

  get  'post_new',         to: 'posts#new',     as: 'post_new'
  post 'post_create',      to: 'posts#create',  as: 'post_create'
  get  'posts_index',      to: 'posts#index',   as: 'posts_index'
  get  'post_show/:id',    to:  'posts#show',   as:'post_show'
  get  'post_edit/:id',    to:  'posts#edit',   as:'post_edit'
  patch 'post_update/:id', to: 'posts#update',  as:'post_update'
  get  'post_destroy/:id', to: 'posts#destroy', as:'post_destroy'

  post 'post_create/:id',  to: 'comments#create',  as: 'comment_create'
  
  
end
