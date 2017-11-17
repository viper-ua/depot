module OrdersHelper
  def pay_options
    options = {}
    Order.pay_types.each {|key, value| options[I18n.t('.'+key)] = key }
    options
  end
end
