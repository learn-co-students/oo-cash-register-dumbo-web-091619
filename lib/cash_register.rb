class CashRegister
  attr_accessor :total, :discount, :items, :last_transaction 
  
  def initialize(discount=nil)
    @total =  0
    @discount = discount
    @last_transaction = nil
    @items = []
  end

  def add_item(item_name, item_price, quantity=1)
    self.total = self.total += item_price * quantity
    self.last_transaction = item_price * quantity
    quantity.to_i.times do
      self.items << item_name
    end  
  end



  def apply_discount
    if self.discount
     self.total = (total * ((100.0 - discount.to_f)/100)).to_i
     "After the discount, the total comes to $800."
    else
     "There is no discount to apply."
   end
 end
 
 def void_last_transaction
   self.total = self.total - self.last_transaction
 end
 
 
 
 
end
