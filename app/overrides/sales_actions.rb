html = '
<div class="field" id="product_sale_price_field">
    <label for="product_price">Sale</label>
<% @product.prices.all.each do |p| %>
      <br />
      <% if p.on_sale? %>
      <label>Sale price:</label>
      <p><%= p.sale_price.to_f %> <%=p.currency%></p>
      <label>Original price:</label>
      <p><%= p.original_price.to_f %> <%=p.currency%></p>
        <%= link_to "Disable Sale #{p.currency}", admin_sale_price_disable_sale_path(p.id), :class => "button icon-cancel" %>
      <br />
      <% else %>
        <%= link_to "Enable Sale #{p.currency}", new_admin_sale_price_path + "?price_id=#{p.id}", :class => "button icon-plus" %>
      <% end %>
<% end %>
</div>
  
'

Deface::Override.new(:virtual_path => "spree/admin/products/_form",
                     :name => "sales_actions",
                     :insert_top => "[data-hook='admin_product_form_right']",
                     :text => html,
                     :disabled => false)