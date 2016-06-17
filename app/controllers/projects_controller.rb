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

  def edit

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
    if @project.update(project_params)
      flash[:notice] =  'Proyecto hasido editado'
      redirect_to @project
    else
      render :edit
    end  	
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
