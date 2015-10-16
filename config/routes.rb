RailsDb::Engine.routes.draw do
  root :to => 'dashboard#index'
  resources :tables, :only => [:index, :show] do
    get 'data'
  end
  get '/sql' => 'sql#index', as: :sql
  post '/execute' => 'sql#execute', as: :sql_execute
end

Rails.application.routes.draw do
  mount_rails_db_routes
end