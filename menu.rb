require_relative 'item'

# Represent's a Hotel Menu which has list of Items served.
class Menu
    include Enumerable
    attr_accessor :menu_items

    # initializes Menu object. 
    # @menu_items stores the items on the hotel menu
    def initialize
        @menu_items = Array.new
    end

    # pushes new Item object to @menu_times
    def << items
        @menu_items << items
    end

    # loops through @menu_items
    def each
        @menu_items.each do |items|
            yield items 
        end
    end

    # returns with array of Item objects which have the dish
    def get_items_with dish
        @menu_items.select {|item| item.has? dish}
    end

    # converts Menu to representable String format
    def to_s
        @menu_items.collect {|i| i.to_s}.to_a.join "\n"
    end

    # checks if Menu is empty
    def empty?
        @menu_items.empty?
    end

end
