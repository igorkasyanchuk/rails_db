module RailsDb
  class ApplicationController < ActionController::Base
    before_action :check_authorization

    def check_authorization
      head :unauthorized unless self.instance_eval(&RailsDb.authorization)
    end
  end
end
