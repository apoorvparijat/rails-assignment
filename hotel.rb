require_relative 'menu'
class Hotel

	attr_accessor :menu

	def initialize
		@menu = Menu.new
		# @id = id
	end

end