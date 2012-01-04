CheckoutController.class_eval do

  before_filter :process_gift, :only => [:update]

  # here if @order has address state we process gift
  def process_gift
    if @order.state == "address"
      @order.set_for_gift(!params[:order][:for_gift].nil?)
    end
  end

end