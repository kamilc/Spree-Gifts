Admin::GeneralSettingsController.class_eval do
  after_filter :update_gift, :only => :update

  def update_gift
    if params[:conf]
        Spree::Config.set(:for_gift_amount => params[:conf][:for_gift_amount])
    end
  end
end