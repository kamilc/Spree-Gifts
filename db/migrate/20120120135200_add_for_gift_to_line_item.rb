class AddForGiftToLineItem < ActiveRecord::Migration
  def self.up
    add_column :line_items, :for_gift,  :boolean, :default => false, :null => false
  end

  def self.down
    remove_column :line_items, :for_gift
  end
end