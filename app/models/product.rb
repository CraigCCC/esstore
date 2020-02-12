class Product < ApplicationRecord
  enum status: [:on_sell, :off_sell, :restocking]
end
