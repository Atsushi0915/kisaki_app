Rails.application.routes.draw do
  root 'posts#top'

  get 'user_new',  to:  'users#new',   as:  'user_new'
  post 'user_create', to:  'users#create',  as:  'user_create'
  get  'user_index',  to:  'users#index',   as:  'users_index'
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
