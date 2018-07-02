Rails.application.routes.draw do
  root :to => 'home#index'

  mount RailsDb::Engine => "/rails/db", as: 'rails_db'

  # namespace :x do
  #   namespace :y do
  #     mount RailsDb::Engine => '/db', :as => 'rails_db'
  #   end
  # end

  # namespace :admin do
  #   namespace :tools do
  #     mount RailsDb::Engine => '/db', :as => 'rails_db'
  #   end
  # end
end
