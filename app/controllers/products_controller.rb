class ProductsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]

  def index
    return @products = Product.sort_by_column(params[:order_by], params[:direction]) if params[:order_by]

    @products = Product.sort_by_created_at
  end

  def show
    @product = Product.find(params[:id])
  end
end
