require 'pry'
class CashRegister
    attr_accessor :total, :items, :last_sale
    attr_reader :discount
    
    def initialize(empl_discount = 0)
        @total = 0
        @discount = empl_discount
        @items = []
    end

    # def total
    #      @total 
    # end

    def add_item(title, price, quantity = 1)
        self.total += price * quantity
        i = 1
        while i <= quantity do
            @items << title
            i += 1
        end
        self.last_sale = price * quantity
    end

    def apply_discount
        if @discount != 0
            self.total = self.total - ((@discount.to_f / 100.to_f) * self.total).to_i
            return "After the discount, the total comes to $#{self.total}."
        else 
            "There is no discount to apply."
        end
    end

    def void_last_transaction
        self.total -= self.last_sale
    end

end
