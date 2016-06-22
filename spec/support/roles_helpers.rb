module RolesHelpers
	def asignar_rol!(user, role, project)
		Rol.where(user: user, project: project).delete_all
		Rol.create!(user: user, nombre: role, project: project)
	end
end

RSpec.configure do |c|
	c.include RolesHelpers
end