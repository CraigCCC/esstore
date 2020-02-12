class Product < ApplicationRecord
  # validations
  validates :name, presence: true, length: { maximum: 50 }
  validates :sku , presence: true, uniqueness: true
  validates :list_price, :sell_price, presence: true, numericality: { greater_than: 0 }
  validate :list_price_greater_than_sell_price?

  # relationships
  enum status: [:on_sell, :off_sell, :restocking]

  #scope

  private

  def list_price_greater_than_sell_price?
    return if (list_price && sell_price).nil?

    errors.add :sell_price, '必須大於 sell_price' if list_price < sell_price
  end
end