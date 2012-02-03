
Deface::Override.new(:virtual_path => "orders/_form",
                    :name => "orders_line_item_add_for_gift",
                    :insert_after => "th:nth-child(3)",
                    :partial => "orders/for_gift_th",
                    :disabled => false)