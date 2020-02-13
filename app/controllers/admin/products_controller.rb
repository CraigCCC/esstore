class Admin::ProductsController < ApplicationController
  before_action :find_product, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!
  before_action :permission_check!

  layout 'backend'

  def index
    return @products = Product.with_attached_images.sort_by_column(params[:order_by], params[:direction]) if params[:order_by]

    @products = Product.sort_by_created_at
  end

  def show
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      redirect_to admin_products_path, notice: '新增完成'
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @product.update(product_params)
      redirect_to edit_admin_product_path(@product), notice: '更新成功'
    else
      render :edit
    end
  end

  def destroy
    @product.destroy
    redirect_to admin_products_path, notice: '刪除成功'
  end

  def destroy_image
    image_blob = ActiveStorage::Attachment.find(params[:id])
    image_blob.purge_later
    redirect_back(fallback_location: edit_admin_product_path)
  end

  private

  def find_product
    @product = Product.with_attached_images.find(params[:id])
  end

  def product_params
    params.require(:product).permit(:name, :describle, :list_price, :sell_price, :quantity, :sku, :status, images: [])
  end

  def permission_check!
    if current_user.role != 'admin'
      redirect_to root_path, notice: '無法存取' 
    end
  end
end
