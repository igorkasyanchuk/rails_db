class ApplicationController < ActionController::Base
#  rescue_from Exception, :with => :error_generic
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  # def error_generic(ex)
  #   binding.pry
  # end
end
