Deface::Override.new(:virtual_path => "orders/_line_item",
                    :name => "orders_line_item_add_for_gift",
                    :insert_after => "[data-hook='cart_item_quantity']",
                    :partial => "orders/for_gift",
                    :disabled => false)