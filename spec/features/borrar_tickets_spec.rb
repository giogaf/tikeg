require "rails_helper"
RSpec.feature "Usuario elimina ticket" do 

	let (:elproyecto) {FactoryGirl.create(:project, nombre: "proyecto con ticket para eliminar")}
	let(:eltiquete) {FactoryGirl.create(:ticket,project: elproyecto)}

	before do 
		visit project_ticket_path(elproyecto,eltiquete)
	end

	scenario "con éxito"	do 
		click_link "Borrar ticket"

		expect(page).to have_content "Ticket eliminado"
		expect(page.current_url).to eq project_url(elproyecto)
	end

end