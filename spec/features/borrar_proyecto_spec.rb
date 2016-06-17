require "rails_helper"
RSpec.feature "Usuario borra proyecto" do
	scenario "exitosamente" do

		FactoryGirl.create(:project, nombre: 'proyecto eliminame')
		
		visit '/'
		click_link "proyecto eliminame"
		click_link "Borrar proyecto"
		
		expect(page).to have_content "Proyecto ha sido eliminado"
		expect(page.current_url).to eq projects_url
		expect(page).to have_no_content 'proyecto eliminame'
	end
end