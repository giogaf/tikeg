require "rails_helper"
RSpec.feature "Usuario crea nuevos tickets" do

	before do 
		proyecto = FactoryGirl.create(:project,nombre: 	"proyecto dameticket")
		visit project_path(proyecto)
		clik_link "Nuevo ticket"
	end

	scenario "con datos válidos" do
		fill_in "nombre",with: "nombre fulano para ticket"
		fill_in "descripcion", with: "una descripcion par ticket"
		click_button "Crear ticket"

		expect(page).to have_content "Ticket creado"
	end

	scenario "con datos inválidos" do 
		click_button "Crear ticket"
		expect(page).to have_content "Ticket no creado"		
		expect(page).to have_content "Name can't be blank"
		expect(page).to have_content "Description can't be blank"		
	end

end
