class LineItem < ApplicationRecord
  belongs_to :order, optional: true
  belongs_to :product, optional: true
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