class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def paper_trail_enabled_for_controller
    controller_path.camelize.deconstantize == "RailsAdmin"
  end
end
