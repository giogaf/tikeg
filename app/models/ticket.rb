class Ticket < ActiveRecord::Base
	validates :nombre, presence: true	
	validates :descripcion, presence: true,length: {minimum: 10}
  belongs_to :project
  belongs_to :autor, class_name: "User"
end
