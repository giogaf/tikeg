require "rails_helper"
RSpec.feature "Usuario puede editar proyecto" do
	scenario "con datos válidos" do
		FactoryGirl.create(:project, nombre: "proyecto editame")

		visit "/"
		click_link "proyecto editame"
		click_link "Editar proyecto"
		fill_in "Nombre", with: "proyecto editado"
		click_button "Guardar proyecto"
	end
end