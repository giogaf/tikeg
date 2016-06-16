require "rails_helper"

RSpec.feature "Usuario crea nuevo proyecto" do 
	scenario "con datos válidos" do 
		visit '/'
		click_link 'Nuevo Proyecto'
		fill_in 'Nombre',with: 'proyecto numero 123'
		fill_in 'Descripcion',with: 'aprendiendo testing con RSpec y capibara'
		click_button 'Crear proyecto'

		project = Project.find_by(nombre:'proyecto numero 123')
		expect(page.current_url).to eq project_url(project)

		titulo = 'proyecto numero 123 - Tikeg'
		expect(page).to have_title titulo
	end
end