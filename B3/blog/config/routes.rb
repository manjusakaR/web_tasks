Rails.application.routes.draw do
  resources :admins
  resources :posts do
    resources :comments
  end
  root 'welcome#index'
  get '/show/:id', to: 'welcome#show',as: 'wshow'
  get '/login',to: 'admins#login',as:'login'
  post '/passed/:id', to: 'comments#passed',as: 'passed'
  get '/ptype/:p_type',to: 'welcome#ptype',as:'ptype'
  get '/destroy_list', to: 'posts#destroy_list',as: 'destroy_post'
  get '/blog_comments', to: 'posts#blog_comments',as: 'blog_comments'
  post '/destroy_comment/:id', to: 'comments#destroy_comment',as: 'destroy_comment'
  get '/logout', to: 'admins#logout',as: 'logout'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
