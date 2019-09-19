
require 'pry'

class CashRegister
attr_accessor :discount, :total, :items, :charges

  def initialize(discount = 0)
    @total = 0
    @discount = discount
    @items = []
    @charges = []
  end

  def add_item(title, price, quantity = 1)
    quantity.times {@items << title}
    @charges << price*quantity
    @total += price*quantity
  end

  def apply_discount
  if @discount == 0
    return "There is no discount to apply."
  else
    @total -= ((@discount / 100.0) * @total)
    "After the discount, the total comes to $#{@total.to_i}."
  end
  end

  def items
    return @items
  end

  def void_last_transaction
    @total -= @charges.pop    
    if !@charges.length
      @total = 0.0
    end
  end
  
end

