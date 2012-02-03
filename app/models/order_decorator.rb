# encoding: utf-8
Order.class_eval do
  before_save :check_for_gift

  def for_gift?
     adjustments.select { |a| a.label == "Wysyłka na prezent" }.count > 0
  end

  def set_for_gift(for_gift)
    if not for_gift? and for_gift
      for_gift_amount = Spree::Config[:for_gift_amount] || 10
      adjustments.build(:amount => for_gift_amount, :label => "Wysyłka na prezent")
    else
      adjustments.select { |a| a.label == "Wysyłka na prezent" }.each { |a| a.delete }
    end
  end

  def check_for_gift
    set_for_gift(self.line_items.select(&:for_gift).count > 0)
  end
end