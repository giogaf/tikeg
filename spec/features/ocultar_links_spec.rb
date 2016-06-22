require "rails_helper"

RSpec.feature "Vista de links" do
	let(:proyecto) {FactoryGirl.create(:project)}
	let(:usuario) {FactoryGirl.create(:user)}
	let(:administrador) {FactoryGirl.create(:user,:administrador)}

	#context 'como usuario anónimo' do
	#	scenario ' link "Nuevo Project" no visible' do
	#		visit "/"
	#		expect(page).not_to have_link "Nuevo Proyecto"
	#	end
	#	scenario ' link "Borrar proyecto" no visible' do
	#		visit project_path(proyecto)
	#		expect(page).not_to have_link "Borrar proyecto"
	#	end
	#end
	context 'como usuario normal' do
		
		before do
			login_as(usuario)
			asignar_rol!(usuario,:lector,proyecto)		
		end

		scenario ' link "Nuevo Project" no visible' do
			visit '/'
			expect(page).not_to have_link "Nuevo Proyecto"
		end	
		scenario ' link "Borrar proyecto" no visible' do
			visit project_path(proyecto)
			expect(page).not_to have_link "Borrar proyecto"
		end		
	end

	context 'como  admnistrador' do
		before {login_as(administrador)}
		scenario ' link "Nuevo Project" visible' do
			visit '/'
			expect(page).to have_link "Nuevo Proyecto"
		end
		scenario ' link "Borrar proyecto" visible' do
			visit project_path(proyecto)
			expect(page).to have_link "Borrar proyecto"
		end		
	end
end