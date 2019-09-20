require 'pry'
class CashRegister
    attr_accessor :total, :items, :discount, :last_transaction_amount 
    def initialize(total = 0, discount = 20)
        @total = total
        @discount = discount
        @items =[]
    end

    def add_item(item, price, qty = 1)
        qty.times do
            self.items << item
        end
        @total += (price * qty)
        
        @last_transaction_amount = @total
    end
    
    def apply_discount
        if self.discount
            discount = @discount/100.to_f
            @total = @total - (@total * discount)
            # binding.pry
            return "After the discount, the total comes to #{self.total}"
        else
            puts "There is no discount to apply."
        end
    end

    def void_last_transaction

        @total -= @last_transaction_amount

    end



   

end
