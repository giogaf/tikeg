require "rails_helper"
RSpec.feature "Usuario ve proyectos" do
	scenario "con los detalles" do
		proyecto = FactoryGirl.create(:project,nombre:'Desarrollador software')  

		visit '/'
		click_link 'Desarrollador software'
		expect(page.current_url).to eq project_url(proyecto)
	end
end