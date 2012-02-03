
Deface::Override.new(:virtual_path => "admin/products/_form",
                    :name => "admin_products_edit_add_for_gift_override",
                    :insert_bottom => "div.right",
                    :partial => "admin/products/for_gift",
                    :disabled => false)