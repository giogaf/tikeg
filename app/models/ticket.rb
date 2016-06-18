class Ticket < ActiveRecord::Base
	validates :nombre, presence: true	
	validates :descripcion, presence: true,length: {minimum: 10}
  belongs_to :project
end
