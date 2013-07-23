Deface::Override.new(:virtual_path => "spree/layouts/admin",
                     :name => "sales_admin_tab",
                     :insert_bottom => "[data-hook='admin_tabs']",
                     :text => "<%= tab(:sale_prices, :icon => 'icon-money') %>",
                     :disabled => false)