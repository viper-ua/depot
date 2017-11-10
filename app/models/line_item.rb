class LineItem < ApplicationRecord
  belongs_to :product
  belongs_to :cart

  def total_price
    product.price * quantity
  end

  def del_line_item
    self.quantity -= 1
    save!
    destroy if quantity == 0
  end
end