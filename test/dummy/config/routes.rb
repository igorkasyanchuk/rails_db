Rails.application.routes.draw do
  root :to => 'home#index'

  mount RailsDb::Engine => "/db", as: 'rails_db'
end
