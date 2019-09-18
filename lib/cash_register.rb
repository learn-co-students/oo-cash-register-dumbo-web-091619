
class CashRegister
    
    attr_accessor :discount, :total, :items, :last_item
    
    def initialize(discount = 0)
        @total = 0.0
        @discount = discount
        @items = []
    end

    def add_item(title, price, quantity = 1)
        items = Array.new(quantity, title)
        self.items.concat(items)
        self.last_item = {title: title, price: price, quantity: quantity}

        item_total =  price * quantity 
        previous_total = self.total
        self.total =  previous_total + item_total
    end

    def apply_discount
        return "There is no discount to apply."  unless discount != 0

        total_before_discount = self.total
        discount_rate = 1 - (self.discount * 0.01)
        self.total = total_before_discount * discount_rate
        return "After the discount, the total comes to $#{self.total.to_i}."
    end

    def void_last_transaction
        price = self.last_item[:price]
        quantity = self.last_item[:quantity]
        title = self.last_item[:title]

        items = Array.new(quantity, title)
        self.items = self.items - items

        item_total =  price * quantity 
        self.total =  self.total - item_total
    end

end