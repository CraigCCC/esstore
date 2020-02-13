class ProductsController < ApplicationController
  before_action :find_product, only: [:show, :edit, :update, :destroy]

  def index
    @products = Product.all
  end

  def show
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      redirect_to products_path, notice: '新增完成'
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @product.update(product_params)
      redirect_to edit_product_path(@product), notice: '更新成功'
    else
      render :edit
    end
  end

  def destroy
    @product.destroy
    redirect_to products_path, notice: '刪除成功'
  end

  def destroy_image
    image_blob = ActiveStorage::Attachment.find(params[:id])
    image_blob.purge_later
    redirect_back(fallback_location: edit_product_path)
  end

  private

  def find_product
    @product = Product.find(params[:id])
  end

  def product_params
    params.require(:product).permit(:name, :describle, :list_price, :sell_price, :quantity, :sku, :status, images: [])
  end
end
