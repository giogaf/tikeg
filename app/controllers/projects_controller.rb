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
	  	redirect_to @project
	  else
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
