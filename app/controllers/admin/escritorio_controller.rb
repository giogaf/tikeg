class Admin::EscritorioController < ApplicationController
  
  before_action :autorizacion_admin!

  def index
  end

  private

  def autorizacion_admin! 
  	authenticate_user! #metodo de devise

  	unless current_user.admin?
  		redirect_to root_path, alert: "Acción solo para administradores"
  	end
  end
end
