class ProductsController < ApplicationController
  allow_unauthenticated_access only: %i[index show]
  before_action :set_product, only: %i[show edit update destroy]
  #show all
  def index
    @products = Product.all
  end
 #show one product
  def show
  end
 #create product
  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      redirect_to @product
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @product.update(product_params)
      redirect_to @product
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @product.destroy
    redirect_to products_path
  end

  private
  def set_product
    @product = Product.find(params[:id])
  end

  def product_params
  # params.require(:product).permit(:name, :price)

  #.except(blacklist)
  #.permit(whitelist)

  #other code implementation
  params.expect(product: [ :name, :price, :category_id])
  end
end
