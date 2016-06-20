class ProjectsController < ApplicationController
  before_action :set_project, only: [:show,:edit,:update]
  def index
  	@projects = Project.all
  end

  def show  	
  end


  def edit

  end


  def update
    if @project.update(project_params)
      flash[:notice] =  'Proyecto ha sido editado'
      redirect_to @project
    else
      flash[:alert] = "Proyecto presenta datos inválidos"
      render :edit
    end  	
  end

  private

  def set_project
    @project = Project.find(params[:id]) 
    rescue ActiveRecord::RecordNotFound
      flash[:alert] = "Proyecto no encontrado"
      redirect_to projects_path  	
  end
  def project_params
  	params.require(:project).permit(:nombre,:descripcion)
  end

end
