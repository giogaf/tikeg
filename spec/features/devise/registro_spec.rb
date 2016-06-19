require "rails_helper"

RSpec.feature "Registro de usuario" do 

	scenario "con datos validos" do 
		visit "/"
		click_link "Registrarse"
		fill_in "Email", with: "gg@gg.com"
		fill_in "user_password", with: "passsap"
		fill_in "Password confirmation", with: "passsap"
		click_button "Sign up"

		expect(page).to have_content "You have signed up successfully"
	end
end