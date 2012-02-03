
Deface::Override.new(:virtual_path => "products/_cart_form",
                    :name => "products_cart_form_add_for_gift",
                    :insert_after => "code[erb-loud]:contains('text_field_tag')",
                    :partial => "products/cart_for_gift",
                    :disabled => false)