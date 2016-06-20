require 'rails_helper'

RSpec.describe Admin::EscritorioController, type: :controller do

	let(:usuario) {FactoryGirl.create(:user)}

	before do
		allow(controller).to receive(:authenticate_user!)
		allow(controller).to receive(:current_user).and_return(usuario)
	end

	context "usuario default" do
		it "no puede acceder a index action" do 
			get :index

			expect(response).to redirect_to '/'
			expect(flash[:alert]).to eq "Acción solo para administradores"
		end
	end
end
