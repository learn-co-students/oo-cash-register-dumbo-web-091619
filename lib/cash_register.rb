require 'pry'
class CashRegister
    attr_accessor :total, :items, :discount, :last_transaction_amount 
    def initialize(discount = 0)
        @total = 0
        @discount = discount
        @items =[]
    end

    def add_item(item, price, qty = 1)
        qty.times do
            self.items << item
        end
        @total += price * qty
        
        @last_transaction_amount = price * qty
    end
    
    def apply_discount
        if self.discount != 0
            self.total = (total * ((100.0 - discount.to_f)/100)).to_i
            # binding.pry
            return "After the discount, the total comes to $#{self.total}."
        else
            return "There is no discount to apply."
        end
    end

    def void_last_transaction

        @total -= @last_transaction_amount

    end



   

end
