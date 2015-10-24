Rails.application.routes.draw do
  root :to => 'home#index'

  mount RailsDb::Engine => "/rails/db"
end
