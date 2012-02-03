Deface::Override.new(:virtual_path  => "admin/general_settings/edit",
                           :insert_bottom => "#preferences",
                           :partial       => "admin/general_settings/gifts",
                           :name          => "gift_admin")