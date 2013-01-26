require_relative 'hotel'
require_relative 'item'
require_relative 'menu'

class Hotels

	def initialize
		@hotels = Hash.new
		begin
			f = File.open ARGV[0]
			headers = f.gets
			f.each_with_index do |line,index|
				# puts "adding #{line}"
				parse_and_create_hotel line if validate line
			end
			f.close
		rescue => e
			puts "Error: #{e.message}"
		end
	end

	# validates the cvs row
	def validate csv_row
		csv_row.strip != ""
	end

	# parses the csv row and creates a new hotel out of it.
	def parse_and_create_hotel str

		# split and trip string retrived from file
		param = str.split ","
		param.collect! {|p| p.strip}

		# create new item and add dishes to the item
		i = Item.new param[0].to_i
		param[2..-1].each {|dish| i << dish}
		i.price = param[1]

		# add new hotel, add item to the hotel menu
		@hotels[param[0].to_i] = Hotel.new if @hotels[param[0].to_i] == nil
		@hotels[param[0].to_i].menu << i

	end

	def to_s
		@hotels.each do |k,v|
			puts "------------------------ Hotel #{k} ------------------------"
			puts v.menu.sort
			puts
		end
	end

	def get_items_serving dish
		new_menu = Menu.new
		@hotels.each do |hotel_id,hotel|
			items_array = hotel.menu.get_items_with dish
			items_array.each {|item| new_menu << item } if !items_array.empty?
		end
		new_menu
	end
end

all_hotels = Hotels.new
all_hotels.to_s

print "Enter dish: \n"
dish = $stdin.gets.strip
new_menu = all_hotels.get_items_serving dish

if new_menu.empty?
	puts "No hotel found."
	exit
end
puts "\nFollowing hotels found serving '#{dish}' \n"
puts new_menu.sort

puts "\nRecommended - "
cheapest = new_menu.sort.first.price
cheap = new_menu.select {|item| cheapest == item.price}
if cheap.length > 1 
	value_for_money = cheap.max {|a,b| a.dishes.length <=> b.dishes.length}
	puts value_for_money
else
	puts cheap
end