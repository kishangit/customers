Rails.application.routes.draw do
  require 'sidekiq/web'

  root to: 'customers#index'

  post '/import' => 'customers#import'

  match '*path' => redirect('/'), via: :get    ## This is fallback route. If we pass anything after 'localhost:3000' then it will fallback to root

  mount ActionCable.server => '/cable'  # mount Actioncable route 
  mount Sidekiq::Web => "/sidekiq"      # mount Sidekiq::Web in your Rails app
end
