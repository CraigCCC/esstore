module ProductsHelper
  def sortable(column)
    direction = params[:direction] == 'DESC' ? 'ASC' : 'DESC'
    link_to t("products.#{column}"), order_by: column, direction: direction
  end

  def cover_image_tag(product, width, height, multiple_image: false)
    if multiple_image
      multiple_cover_image(product, width, height)
    elsif product.images.attached?
      simple_cover_image(product, width, height)
    else
      fake_image(width, height)
    end
  end

  private

  def multiple_cover_image(product, width, height)
    image_tag product.variant(resize_to_fill: ["#{width}", "#{height}"])
  end

  def simple_cover_image(product, width, height)
    image_tag product.images.first.variant(resize_to_fill: ["#{width}", "#{height}"])
  end

  def fake_image(width, height)
    image_tag "https://fakeimg.pl/#{width}x#{height}/?text=upload image!"
  end
end
