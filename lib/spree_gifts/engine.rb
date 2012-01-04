module SpreeGift
  class Engine < Rails::Engine
    engine_name 'spree_gifts'

    config.autoload_paths += %W(#{config.root}/lib)

    # use rspec for tests
    config.generators do |g|
      g.test_framework :rspec
    end

    def self.activate
      Dir.glob(File.join(File.dirname(__FILE__), "../../app/**/*_decorator*.rb")) do |c|
        Rails.application.config.cache_classes ? require(c) : load(c)
      end

      Dir.glob(File.join(File.dirname(__FILE__), "../../app/overrides/*.rb")) do |c|
        Rails.application.config.cache_classes ? require(c) : load(c)
      end

      if Spree::Config[:for_gift_amount].nil?
        Spree::Config.set(:for_gift_amount => 10)
      end

      Deface::Override.new(:virtual_path  => "checkout/_address",
            :insert_before => "#billing",
            :partial       => "checkout/gifts",
            :name          => "gift_option")

      Deface::Override.new(:virtual_path  => "admin/general_settings/edit",
                           :insert_bottom => "#preferences",
                           :partial       => "admin/general_settings/gifts",
                           :name          => "gift_admin")

    end

    config.to_prepare &method(:activate).to_proc
  end
end
