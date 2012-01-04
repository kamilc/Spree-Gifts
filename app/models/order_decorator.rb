# encoding: utf-8
Order.class_eval do
  def for_gift?
     adjustments.select { |a| a.label == "Wysyłka na prezent" }.count > 0
  end

  def set_for_gift(for_gift)
    if for_gift and not for_gift?
      for_gift_amount = Spree::Config[:for_gift_amount] || 10
      adjustments.build(:amount => for_gift_amount, :label => "Wysyłka na prezent")
    else
      adjustments.select { |a| a.label == "Wysyłka na prezent" }.each { |a| a.delete }
    end
  end
end