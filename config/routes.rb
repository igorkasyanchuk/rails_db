RailsDb::Engine.routes.draw do
  root :to => 'dashboard#index'
  resources :tables, :only => [:index, :show] do
    get 'data'
    get 'csv'
    get 'truncate'
  end
  get '/sql' => 'sql#index', as: :sql
  post '/execute' => 'sql#execute', as: :sql_execute
  post '/sql-csv' => 'sql#csv', as: :sql_csv

  get '/import' => 'sql#import', as: :sql_import
  post '/import-start' => 'sql#import_start', as: :sql_start_import

  get '/data-table' => 'dashboard#data_table', as: :data_table
end

if RailsDb.automatic_routes_mount
  Rails.application.routes.draw do
    mount_rails_db_routes
  end
end