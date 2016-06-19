require "rails_helper"

RSpec.feature "Usuario cierra sesion" do 
  let!(:el_usuario) {FactoryGirl.create(:user)}

  before do 
  	login_as(el_usuario)
  end

  scenario do
  	visit "/"
  	click_link 'Salir'
  	expect(page).to have_content 'Signed out successfully'
  end
end
