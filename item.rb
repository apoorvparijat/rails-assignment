# Represents Items on a Hotel Menu
class Item
    include Enumerable
    include Comparable

    # @price stores the cost of this item
    # Since an item on hotel menu can have many dishes, dishes are stored in @dishes array
    attr_accessor :price, :dishes

    def initialize hotel_id
        @dishes = Array.new
        @price = 0.0
        @hotel_id = hotel_id
    end

    # pushes new dish in the @dishes array
    def << dish
        @dishes << dish
    end

    # loops through @dishes
    def each
        @dishes.each do |dish|
            yield dish
        end
    end

    def has? dish
        # puts "\t Checking #{self.to_s} .."
        @dishes.any? {|d| d.downcase == dish.downcase}
    end

    # used to sort Item based on the price
    def <=> other
        @price <=> other.price
    end

    def to_s
        "Hotel: #{@hotel_id} Price: #{@price} - #{@dishes.to_s}"
    end
end