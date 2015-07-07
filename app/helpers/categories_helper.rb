module CategoriesHelper
	def is_admin?
		return current_user.try(:admin?)
	end
end
