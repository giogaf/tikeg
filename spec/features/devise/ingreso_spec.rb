require "rails_helper"
RSpec.feature "Usuario registrado ingresa" do
	
	let!(:mi_usuario) {FactoryGirl.create(:user)}
	scenario " con credenciales" do 
		visit "/"
		click_link "Ingresar"
		fill_in 'Email', with: mi_usuario.email
		fill_in 'Password', with: 'passsap'
		click_button "Log in"

		expect(page).to have_content 'Signed in successfully.'
		expect(page).to have_content "Signed in as #{mi_usuario.email}"
	end

end
