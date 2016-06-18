class TicketsController < ApplicationController
  before_action :set_project
  before_action :set_ticket, only: [:show,:edit,:update,:destroy]
  def index
  end

  def new
  	@ticket  =  @project.tickets.build
  end

  def create
  	@ticket  = @project.tickets.build(params_ticket)
  	if @ticket.save
  		flash[:notice] = "Ticket creado"
  		redirect_to [@project,@ticket]
  	else
  		flash[:alert] = "Ticket no creado"
  		render :new
  	end
  end

  def show
  end

  def edit
  end
  def update
    
    if @ticket.update params_ticket
      flash[:notice] =  "Ticket Guardado"
      redirect_to [@project,@ticket]
    else
      flash[:alert] = "Ticket no guardado"
      render :edit
    end
  end
private
  def set_project
  	@project = Project.find(params[:project_id])
  end

  def set_ticket
  	@ticket = @project.tickets.find(params[:id])
  end

  def params_ticket
  	params.require(:ticket).permit(:nombre,:descripcion)
  end

end
