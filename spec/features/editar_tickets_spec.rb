require "rails_helper"
RSpec.feature "Usuario edita tickets" do
	let(:usuario_autor) {FactoryGirl.create(:user)}
	let(:proyecto) {FactoryGirl.create(:project)}
	let(:tiquete) {FactoryGirl.create(:ticket,project: proyecto,autor: usuario_autor)}	
	
	before do 
		visit project_ticket_path(proyecto,tiquete)
		click_link "Editar ticket"
	end

	scenario "con datos válidos" do
		fill_in "Nombre", with: "nuevo nombre ticket"
		click_button "Crear ticket"
		expect(page).to have_content "Ticket Guardado"	

		within("#ticket") do 
			expect(page).to have_content "nuevo nombre ticket"
			expect(page).not_to have_content tiquete.nombre
		end
	end

	scenario "con datos no válidos" do 
		fill_in "Nombre", with:""
		click_button "Crear ticket"
		expect(page).to have_content "Ticket no guardado"
	end
end