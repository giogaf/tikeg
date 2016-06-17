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
      flash[:notice] =  'Proyecto ha sido editado'
      redirect_to @project
    else
      flash[:alert] = "Proyecto presenta datos inválidos"
      render :edit
    end  	
  end

  def destroy
    @project.destroy
    flash[:notice] =  "Proyecto ha sido eliminado"
    redirect_to @project
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
