class ApplicationController < ActionController::Base

	include Pundit
	
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  rescue_from Pundit::NotAuthorizedError, with: :sin_autorizacion

  private

  def sin_autorizacion
  	redirect_to root_path, alert: "Perfil de cuenta, no permite esa acción"
  end

end
