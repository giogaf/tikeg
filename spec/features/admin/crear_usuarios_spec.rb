require "rails_helper"

RSpec.feature "Administrador puede crear usuarios" do 
	let(:administrador) {FactoryGirl.create(:user,:administrador)}

	before do
		login_as administrador
		visit '/'
		click_link "Administrar"
		click_link "Usuarios"
		click_link "Nuevo usuario"
	end

	scenario "con datos válidos" do
		fill_in "Email", with: "nuevo@gg.com"
		fill_in "Password", with: "nuevo123"
		click_button "Crear usuario"

		expect(page).to have_content "User has been created."
	end
end