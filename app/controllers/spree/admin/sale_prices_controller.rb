class Spree::Admin::SalePricesController < Spree::Admin::ResourceController
  def index
    @sales = Spree::SalePrice.all
  end

  def put_on_sale
    raise "sale"
  end

  def show
    @sale_price = Spree::SalePrice.find(params[:id])
  end

  def disable_sale
    @price = Spree::Price.find(params[:sale_price_id])
    variant = Spree::Variant.find(@price.variant_id)
    if @price.stop_sale
      redirect_to admin_product_path(variant.product.permalink), notice: 'Sale was successfully stopped.'
    else
      redirect_to admin_product_path(variant.product.permalink)
    end
  end

  def new
    @sale_price = Spree::SalePrice.new
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @sale_price }
    end
  end

  def create
    # authorize! :create, @sale
    @price = Spree::Price.find_by_id(params[:sale_price]["price_id"])
    @new_price = params[:sale_price]["value"]

    variant = Spree::Variant.find(@price.variant_id)

    respond_to do |format|
      if @price.put_on_sale(@new_price)
        format.html { redirect_to admin_product_path(variant.product), notice: 'Sale was successfully created.' }
        format.json { render json: variant.product, status: :created, location: variant.product }
      else
        format.html { render action: "new" }
        format.json { render json: variant.product.errors, status: :unprocessable_entity }
      end
    end
  end
end