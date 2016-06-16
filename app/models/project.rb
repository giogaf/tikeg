class Project < ActiveRecord::Base
	validates  :nombre, presence: true
end
