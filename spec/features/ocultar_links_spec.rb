require "rails_helper"

RSpec.feature "Vista de links" do
	let(:usuario) {FactoryGirl.create(:user)}
	let(:administrador) {FactoryGirl.create(:user,:administrador)}

	context 'como usuario anónimo' do
		scenario ' link "Nuevo Project" no visible' do
			visit "/"
			expect(page).not_to have_link "Nuevo Proyecto"
		end
	end
	context 'como usuario normal'do
	before {login_as(usuario)}
		scenario ' link "Nuevo Project" no visible' do
			visit '/'
			expect(page).not_to have_link "Nuevo Proyecto"
		end	
	end

	context 'como  admnistrador' do
		before {login_as(administrador)}
		scenario ' link "Nuevo Project" visible' do
			visit '/'
			expect(page).to have_link "Nuevo Proyecto"
		end
	end
end