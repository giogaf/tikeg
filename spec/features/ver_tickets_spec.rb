require "rails_helper"
RSpec.feature "usuario ve tickets" do

		before do 
			proyecto = FactoryGirl.create(:project,nombre: "projecto ver ticket")
			FactoryGirl.create(:ticket, project: proyecto,
				nombre: "nombre del ticket",
				descripcion: "descripcion del ticket")
			otroproyecto = FactoryGirl.create(:project, 
				nombre:"otro proyecto, otro ticket")
			FactoryGirl.create(:ticket, project: otroproyecto,
				nombre: "otro nombre",
				descripcion: 'una descripcion')
			visit '/'
		end


	scenario "con proyecto válido" do
		click_link "projecto ver ticket"
		expect(page).to have_content "nombre del ticket"
		expect(page).to have_content "descripcion del ticket"

		click_link "nombre del ticket"
		
	end
end