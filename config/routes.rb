Rails.application.routes.draw do

  devise_for :users, controllers: { sessions: 'users/sessions', registrations: 'users/registrations' }
  resources :blog_posts

  root 'front#index'

  get '/user/:username'                 => 'front#show_user',               :as => :show_user


  get '/block/post/:id'                 => 'block#post',                    :as => :block_post
  get '/block/project/:id'              => 'block#project',                 :as => :block_project


  #post routes
  resources :block

  get '/blocks_overview'                => 'admin#index',                   :as => :blocks_overview
end
