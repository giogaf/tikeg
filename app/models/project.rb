class Project < ActiveRecord::Base
	validates  :nombre, presence: true
	has_many :tickets,dependent: :restrict_with_error#dependent: :delete_all#dependent: :destroy
	has_many :rols, dependent:  :delete_all

end
