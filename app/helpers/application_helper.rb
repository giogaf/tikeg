module ApplicationHelper
	def titulo(*parts)
		unless parts.empty?
			content_for :titulo do
				(parts <<'Tikeg').join(' - ')
			end
		end
	end
end
