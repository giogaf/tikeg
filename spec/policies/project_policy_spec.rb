require 'rails_helper'

RSpec.describe ProjectPolicy do

  let(:user) { User.new }

  subject { described_class }

  permissions :show? do
    let(:el_usuario) {FactoryGirl.create(:user)}
    let(:el_proyecto) { FactoryGirl.create(:project)}
    let(:el_admin) { FactoryGirl.create(:user, :administrador)}

    it "bloqueo usuario anónimo" do
      expect(subject).not_to permit(nil,el_proyecto)
    end

    it "permite usuario rol lector" do
      asignar_rol!(el_usuario,:lector,el_proyecto)
      expect(subject).to permit(el_usuario,el_proyecto)
    end

    it "permite usuario rol editor" do
      asignar_rol!(el_usuario,:editor,el_proyecto)
      expect(subject).to permit(el_usuario,el_proyecto)      
    end

    it "permite usuario rol gestor" do
      asignar_rol!(el_usuario,:gestor,el_proyecto)
      expect(subject).to permit(el_usuario,el_proyecto)      
    end

    it "permite usuario rol administrador" do
      
      expect(subject).to permit(el_admin,el_proyecto)      
    end

    it "no permite usuarios de otros proyectos"do
      proyecto_x = FactoryGirl.create(:project)
      asignar_rol!(el_usuario,:gestor,proyecto_x)
      expect(subject).not_to permit(el_usuario,el_proyecto)            
    end

  end

end
