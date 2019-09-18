class CashRegister
    attr_accessor(:total, :discount, :items, :title)
    def initialize(discount=0)
        @discount = discount
        @total = 0
        @items = []
        @price = []
    end
    def add_item(title, price, opt_quant=nil)
        if opt_quant
            price = price*opt_quant
            x=0
            while x<opt_quant
            @items << title
            x+=1
            end
        else
            @items << title
        end
        @price << price
        previous_total = self.total
        self.total += price
        return title
    end

    def apply_discount
        if self.discount > 0
        self.total = self.total-((self.total/100)*self.discount)
        return "After the discount, the total comes to $#{self.total}."
        else
            return "There is no discount to apply."
        end
    end

    def items
        return @items
    end
    def void_last_transaction 
        @total = @total -@price.last
    end
end
