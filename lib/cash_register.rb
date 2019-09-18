class CashRegister
  
  attr_accessor :discount, :total, :price, :items, :last_price, :last_item
  
  def initialize(discount = 0)
    @total = 0
    @discount = discount
    @items = []
  end
  
  def total 
    @total
  end 
  
  def add_item(title, price, quantity = nil)
    if quantity
      price = price*quantity
      @total += price
      quantity.times do @items << title
      @last_price = price
      end
    else
      @total += price
      @items << title
      @last_price = price
    end
  end
  
  def apply_discount
    if @discount != 0
      @total = @total*(100-@discount)/100
      return "After the discount, the total comes to $#{@total}."
    else
      return "There is no discount to apply."
    end
  end
  
  def items
    @items
  end
  
  def void_last_transaction
    @total = @total - @last_price
  end
end

