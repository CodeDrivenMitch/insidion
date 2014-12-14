Rails.application.routes.draw do

  resources :blog_posts

  root 'default#index'

  get '/block/post/:id' => 'block#post', :as => :block_post
  get '/block/project/:id' => 'block#project', :as => :block_project


  #post routes
  resources :block

  get '/admin' => 'admin#index', :as => :admin_index
end
