class AddForGiftToProduct < ActiveRecord::Migration
  def self.up

    # then add floats: step and round and string: unit
    # to products
    add_column :products, :for_gift,  :boolean, :default => false, :null => false
  end

  def self.down
    remove_column :products, :for_gift
  end
end