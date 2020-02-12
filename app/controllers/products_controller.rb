class ProductsController < ApplicationController

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
    @product = Product.find(params[:id])
  end

  def update
    @product = Product.find(params[:id])
    if @product.update(product_params)
      redirect_to edit_product_path(@product), notice: '更新成功'
    else
      render :edit
    end
  end

  def destroy
  end

  private

  def find_production
    @prodcut = Product.find(params[:id])
  end

  def product_params
    params.require(:product).permit(:name, :describe, :list_price, :sell_price, :sku, :status)
  end
end
