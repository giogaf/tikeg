class Admin::UsuariosController < Admin::EscritorioController#ApplicationController
    before_action :set_user,only: [:show,:edit,:update,:deshabilitar]

  def deshabilitar
    
    if @user  == current_user
      flash[:alert] = "Esta cuenta de administrador no puede eliminarse"
    else 
    @user.deshabilitar
    flash[:notice] = "Usuario deshabilitado"      
    end

    redirect_to admin_usuarios_path
  end
    
  def index
  	@users = User.excluir_deshabilitado.order(:email)#@users =  User.order(:email)
  end

  def new
  	@user = User.new
    logger.debug "N*******************************"
    logger.debug  p @user.email
  end

  def show
  	
  end

  def edit
    logger.debug "E*******************************"
    logger.debug p @user.email
  end

  def update

    if params[:user][:password].blank?
      params[:user].delete(:password)
    end

    if @user.update(params_user)
      flash[:notice] = "User has been updated."
      redirect_to admin_usuarios_path
    else
      flash[:alert] = "User has not been updated."
      render :edit
    end
  end

  def create
  	@user  =  User.new(params_user)
  	if @user.save
  		flash[:notice] = "User has been created."
  		redirect_to admin_usuarios_path #@user
  	else
  		flash[alert] = "User has not been created."
  		render :new
  	end
  end

  private

  def set_user
  	@user = User.find(params[:id])
  end

  def params_user
  	params.require(:user).permit(:email,:password,:admin)
  end

end
