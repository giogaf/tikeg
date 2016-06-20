module ApplicationHelper
	def titulo(*parts)
		unless parts.empty?
			content_for :titulo do
				(parts <<'Tikeg').join(' - ')
			end
		end
	end
	def solo_administrador(&block)
		block.call if  current_user.try(:admin?)
	end
end
