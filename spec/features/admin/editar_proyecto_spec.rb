require "rails_helper"
RSpec.feature "Usuario puede editar proyecto" do

	let(:el_proyecto) {FactoryGirl.create(:project,nombre:"proyecto editame")}
	let(:el_usuario) {FactoryGirl.create(:user)}

	before do 
		#FactoryGirl.create(:project, nombre: "proyecto editame")

		login_as(el_usuario)
		asignar_rol!(el_usuario,:lector,el_proyecto)

		visit "/"
		click_link "proyecto editame"
		click_link "Editar proyecto"
	end

	scenario "con datos válidos" do

		fill_in "Nombre", with: "proyecto editado"
		click_button "Crear proyecto"
		expect(page).to have_content "Proyecto ha sido editado"
		expect(page).to have_content "proyecto editado"
	end

	scenario  "con datos inválidos" do 
		fill_in "Nombre", with: ""
		click_button "Crear proyecto"
		expect(page).to have_content "Proyecto presenta datos inválidos"
	end
end