require "rails_helper"
RSpec.feature "Usuario crea nuevos tickets" do

	let(:el_usuario) {FactoryGirl.create(:user)}

	before do 
		login_as(el_usuario)
		proyecto = FactoryGirl.create(:project,nombre: 	"proyecto dameticket")
		asignar_rol!(el_usuario,:lector,proyecto)
		visit project_path(proyecto)
		click_link "Nuevo ticket"
	end

	scenario "con datos válidos" do
		fill_in "Nombre",with: "nombre fulano para ticket"
		fill_in "Descripcion", with: "una descripcion par ticket"
		click_button "Crear ticket"

		expect(page).to have_content "Ticket creado"
		within('#ticket') do 
		expect(page).to have_content "Autor: #{el_usuario.email}"
		end
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
