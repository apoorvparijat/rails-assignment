class Item
    include Enumerable
    include Comparable
    attr_accessor :price
    def initialize
        @dishes = Array.new
        @price = 0.0
    end
    def << dish
        @dishes << dish
    end
    def each
        @dishes.each do |dish|
            yield dish
        end
    end
    def <=> other
        @price <=> other.price
    end
    def to_s
        @dishes.to_s
        "Price: #{@price} - #{@dishes.to_s}"
    end
end

class Menu
    include Enumerable
    def initialize
        @menu_items = Array.new
    end
    def << items
        @menu_items << items
    end
    def each
        @menu_items.each do |items|
            yield items 
        end
    end
    def to_s
        @menu_items.collect {|i| i.to_s}
    end
end

i = Item.new
i << "Burger" << "Ice cream"
i.price = 14.0
i2 = Item.new
i2 << "Coke"
i2.price = 10.0
m = Menu.new
m << i << i2
puts m.sort
