class ProjectsController < ApplicationController
  before_action :set_project, only: [:show,:edit,:update,:destroy]
  def index
  	@projects = Project.all
  end

  def show  	
  end

  def new
  	@project = Project.new
  end


  def create  	
  	@project = Project.new(project_params)
	  if @project.save
      flash[:notice]= 'Proyecto fue creado'
	  	redirect_to @project
	  else
      flash.now[:alert]='Proyecto no creado'
	  	render :new
	  end
  end

  def update  	
  end

  def destroy  	
  end

  private

  def set_project
  @project = Project.find(params[:id]) 	
  end
  def project_params
  	params.require(:project).permit(:nombre,:descripcion)
  end

end
