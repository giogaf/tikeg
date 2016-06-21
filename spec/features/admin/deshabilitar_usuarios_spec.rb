require "rails_helper"

RSpec.feature "Administrador deshabilita usuarios" do
	let(:usuario_admin) {FactoryGirl.create(:user,:administrador)}
	let(:usuario_vencido) {FactoryGirl.create(:user)}

	before do
		login_as(usuario_admin)
	end

	scenario "con éxito" do
		visit admin_usuario_path(usuario_vencido)
		click_link "Deshabilitar Usuario"
		
		expect(page).to have_content "Usuario deshabilitado"
		expect(page).not_to have_content usuario_vencido.email
	end

	scenario ",exepto su propia cuenta" do
		visit admin_usuario_path(usuario_admin)
		click_link "Deshabilitar Usuario"

		expect(page).to have_content "Esta cuenta de administrador no puede eliminarse"
	end
end