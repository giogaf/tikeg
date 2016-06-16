require "rails_helper"

RSpec.feature "Usuario crea nuevo proyecto" do 
	scenario "con datos válidos" do 
		visit '/'
		click_link 'Nuevo Proyecto'
		fill_in 'Nombre',with: 'proyecto numero 123'
		fill_in 'Descripcion',with: 'aprendiendo testing con RSpec y capibara'
		click_button 'Crear proyecto'
	end
end