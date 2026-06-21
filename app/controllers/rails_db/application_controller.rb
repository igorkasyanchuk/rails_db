module RailsDb
  class ApplicationController < ActionController::Base
    helper :all
    helper_method :per_page

    before_action :verify_access
    before_action :set_abstract_model_class

    if RailsDb.http_basic_authentication_enabled
      http_basic_authenticate_with name: RailsDb.http_basic_authentication_user_name,
                                   password: RailsDb.http_basic_authentication_password
    end

    private

    def verify_access
      result = RailsDb.verify_access_proc.call(self)
      redirect_to('/', error: 'Access Denied', status: 401) unless result
    end

    def per_page
      params[:per_page] || session[:per_page]
    end

    def set_abstract_model_class
      return unless params[:abstract_model_class].present?

      if (found = RailsDb.available_abstract_model_classes.find { |klass| klass.name == params[:abstract_model_class] })
        RailsDb.abstract_model_class = found
      end
    end
  end
end

