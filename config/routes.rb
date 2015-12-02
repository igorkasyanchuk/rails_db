RailsDb::Engine.routes.draw do
  root :to => 'dashboard#index'

  resources :tables, :only => [:index, :show] do
    get 'data'
    get 'csv'
    get 'truncate'
    get 'destroy' # to handle opens in new window (GET)
    get 'edit'    # to handle opens in new window (GET)
    put 'update'  # to handle opens in new window (GET)
    get 'xlsx'
    get 'new'
    post 'create'
  end

  get '/sql' => 'sql#index', as: :sql
  get '/import' => 'sql#import', as: :sql_import

  post '/execute' => 'sql#execute', as: :sql_execute
  post '/sql-csv' => 'sql#csv', as: :sql_csv
  post '/sql-xls' => 'sql#xls', as: :sql_xls
  post '/import-start' => 'sql#import_start', as: :sql_start_import

  get '/data-table' => 'dashboard#data_table', as: :data_table
  get '/standalone' => 'dashboard#standalone', as: :standalone
end

if RailsDb.automatic_routes_mount
  Rails.application.routes.draw do
    mount_rails_db_routes
  end
end