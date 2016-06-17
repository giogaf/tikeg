require 'rails_helper'

RSpec.describe ProjectsController, type: :controller do

  describe "GET #index" do
    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #new" do
    it "returns http success" do
      get :new
      expect(response).to have_http_status(:success)
    end
  end

  it "Manejo de proyecto no encontrado" do 
    get :show,id:"not-here"

    expect(response).to redirect_to projects_path

    msg = "Proyecto no encontrado"
    expect(flash[:alert]).to eq msg
  end
end
