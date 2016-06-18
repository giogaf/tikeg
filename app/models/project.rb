class Project < ActiveRecord::Base
	validates  :nombre, presence: true
	has_many :tickets
end
