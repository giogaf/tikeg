class Admin::UsuariosController < Admin::EscritorioController#ApplicationController
  def index
  	@users =  User.order(:email)
  end
end
