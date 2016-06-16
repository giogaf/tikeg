require "rails_helper"

RSpec.feature "Usuario crea nuevo proyecto" do 
	before do
		visit '/'
		click_link 'Nuevo Proyecto'		
	end
	
	scenario "con datos válidos" do 

		fill_in 'Nombre',with: 'proyecto numero 123'
		fill_in 'Descripcion',with: 'aprendiendo testing con RSpec y capibara'
		click_button 'Crear proyecto'

		project = Project.find_by(nombre:'proyecto numero 123')
		expect(page.current_url).to eq project_url(project)

		titulo = 'proyecto numero 123 - Tikeg'
		expect(page).to have_title titulo
	end

	scenario "con datos vacios" do
		
		click_button 'Crear proyecto'
		expect(page).to have_content 'Proyecto no creado'
		expect(page).to have_content "Nombre can't be blank"#'Ingrese un nombre para proyecto'
	end
end