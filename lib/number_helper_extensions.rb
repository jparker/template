module ActionView::Helpers::NumberHelper
  # Ensure the #number_to_currency always outputs a numeric value (0).
  def number_to_currency_with_default(number, options = {})
    number_to_currency_without_default(number || 0, options)
  end
  alias_method_chain :number_to_currency, :default
end
