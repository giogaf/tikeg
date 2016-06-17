require "rails_helper"
RSpec.feature "Usuario puede editar proyecto" do
	before do 
		FactoryGirl.create(:project, nombre: "proyecto editame")

		visit "/"
		click_link "proyecto editame"
		click_link "Editar proyecto"
	end

	scenario "con datos válidos" do

		fill_in "Nombre", with: "proyecto editado"
		click_button "Guardar proyecto"
		expect(page).to have_content "Proyecto ha sido editado"
		expect(page).to have_content "proyecto editado"
	end
end