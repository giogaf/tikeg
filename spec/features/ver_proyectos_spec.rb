require "rails_helper"
RSpec.feature "Usuario ve proyectos" do
	
	let(:usuario_miron) {FactoryGirl.create(:user)}
	let(:un_proyecto) {FactoryGirl.create(:project)}

	before do
		login_as(usuario_miron)
		asignar_rol!(usuario_miron,:viewer,un_proyecto)
	end

	scenario "con los detalles" do

		visit '/'
		click_link un_proyecto.nombre
		expect(page.current_url).to eq project_url(un_proyecto)
	end
end