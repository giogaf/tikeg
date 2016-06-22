require 'rails_helper'

RSpec.describe ProjectsController, type: :controller do

	it "Redirección de usuario ante error" do

		allow(controller).to receive(:current_user)
		un_proyecto = FactoryGirl.create(:project)
		get :show, id: un_proyecto

		expect(response).to redirect_to(root_path)
		mensaje = "Perfil de cuenta, no permite esa acción"
		expect(flash[:alert]).to eq mensaje

	end
end