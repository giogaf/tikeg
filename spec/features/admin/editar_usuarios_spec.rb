require "rails_helper"

RSpec.feature "Administrador edita cuenta usuario" do

	let(:usuario_admin) {FactoryGirl.create(:user,:administrador)}
	let(:usuario_normal) {FactoryGirl.create(:user)}

	before do
		login_as(usuario_admin)
		visit admin_usuario_path(usuario_normal)
		click_link "Editar usuario"
	end

	scenario "con datos válidos" do
		fill_in "Email",with: "usuarioeditado@gg.com"
		click_button 'Crear usuario'

		expect(page).to have_content "User has been updated."
		expect(page).to have_content "usuarioeditado@gg.com"
		expect(page).to_not have_content usuario_normal.email
	end

	scenario "cambiando a tipo administrador" do
		check "Administrador?"
		click_button 'Crear usuario'

		expect(page).to have_content "User has been updated."
		expect(page).to have_content "#{usuario_normal.email} (Administrador)"
	end
	
end