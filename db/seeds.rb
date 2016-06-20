# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
unless User.exists?(email: "admin@gg.com")
	User.create!(email: "admin@gg.com",password: "admin123", admin: true)
end

unless User.exists?(email: 'noadmin@gg.com')
	User.create!(email: 'noadmin@gg.com',password: 'noadmin123',admin: false)
end

['proyecto1','proyecto2','proyecto3','proyecto4','proyecto5'].each do |nombre|
	unless Project.exists?(nombre: nombre)
		Project.create!(nombre: nombre, descripcion: "una descripcion ejemplo para #{nombre}")
	end
end