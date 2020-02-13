module Admin::ProductsHelper
  def sortable(column)
    direction = params[:direction] == 'DESC' ? 'ASC' : 'DESC'
    link_to '價格', order_by: column, direction: direction
  end
end
