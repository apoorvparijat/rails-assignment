require_relative 'menu'

# Represents a Hotel with a Menu
class Hotel

	attr_accessor :menu

	def initialize
		@menu = Menu.new
		# @id = id
	end

end