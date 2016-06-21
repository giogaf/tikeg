class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  scope :excluir_deshabilitado, lambda{ where(deshabilitado: nil) }
  def to_s
  	"#{email} (#{admin? ? "Administrador" : "Usuario" })"
  end

  def deshabilitar
  	self.update(deshabilitado: Time.now)
  end
end
