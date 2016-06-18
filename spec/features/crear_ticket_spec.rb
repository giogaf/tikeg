require "rails_helper"
RSpec.feature "Usuario crea nuevos tickets" do

	before do 
		proyecto = FactoryGirl.create(:project,nombre: 	"proyecto dameticket")
		visit project_path(proyecto)
		click_link "Nuevo ticket"
	end

	scenario "con datos válidos" do
		fill_in "Nombre",with: "nombre fulano para ticket"
		fill_in "Descripcion", with: "una descripcion par ticket"
		click_button "Crear ticket"

		expect(page).to have_content "Ticket creado"
	end

	scenario "con datos inválidos" do 
		click_button "Crear ticket"
		expect(page).to have_content "Ticket no creado"		
		expect(page).to have_content "Nombre can't be blank"
		expect(page).to have_content "Descripcion can't be blank"		
	end

	scenario " con descripción cortisima" do
		fill_in "Nombre", with: "un proyecto no válido"
		fill_in "Descripcion", with: "corto"
		click_button "Crear ticket"

		expect(page).to have_content "Ticket no creado"	
		expect(page).to have_content "Descripcion is too short"
	end

end
