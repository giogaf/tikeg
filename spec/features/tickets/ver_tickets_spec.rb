require "rails_helper"
RSpec.feature "usuario ve tickets" do

		before do 
			un_autor = FactoryGirl.create(:user)
			proyecto = FactoryGirl.create(:project,nombre: "projecto ver ticket")

			asignar_rol!(un_autor,:lector,proyecto)

			FactoryGirl.create(:ticket, project: proyecto,
				autor: un_autor,
				nombre: "nombre del ticket",
				descripcion: "descripcion del ticket")
			otroproyecto = FactoryGirl.create(:project, 
				nombre:"otro proyecto, otro ticket")
			FactoryGirl.create(:ticket, project: otroproyecto,
				autor: un_autor,
				nombre: "otro nombre",
				descripcion: 'una descripcion')

			asignar_rol!(un_autor,:lector,otroproyecto)

			login_as(un_autor)
			visit '/'
		end


	scenario "con proyecto válido" do
		click_link "projecto ver ticket"
		expect(page).to have_content "nombre del ticket"
		expect(page).to have_content "descripcion del ticket"

		click_link "nombre del ticket"
		
	end
end