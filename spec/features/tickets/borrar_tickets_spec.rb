require "rails_helper"
RSpec.feature "Usuario elimina ticket" do 
	let(:el_autor) {FactoryGirl.create(:user)}
	let (:elproyecto) {FactoryGirl.create(:project, nombre: "proyecto con ticket para eliminar")}

	let(:eltiquete) {FactoryGirl.create(:ticket,project: elproyecto,autor:el_autor)}

	before do 
		login_as(el_autor)
		asignar_rol!(el_autor,:lector,elproyecto)
		visit project_ticket_path(elproyecto,eltiquete)
	end

	scenario "con éxito"	do 
		click_link "Borrar ticket"

		expect(page).to have_content "Ticket eliminado"
		expect(page.current_url).to eq project_url(elproyecto)
	end

end