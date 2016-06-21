class Admin::UsuariosController < Admin::EscritorioController#ApplicationController
    before_action :set_user,only: [:show,:edit,:update,:destroy]
    before_action :params
  def index
  	@users =  User.order(:email)
  end

  def new
  	@user = User.new
  end

  def show
  	
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
  	params.require(:user).permit(:email,:password)
  end

end
