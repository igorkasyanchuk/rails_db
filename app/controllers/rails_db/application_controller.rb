module RailsDb
  class ApplicationController < ActionController::Base

      if RailsDb.http_basic_authentication_enabled
        http_basic_authenticate_with name: RailsDb.http_basic_authentication_user_name,
                                     password: RailsDb.http_basic_authentication_password
      end

  end
end

