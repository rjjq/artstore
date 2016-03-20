class Cart < ActiveRecord::Base
  has_many :cart_items, dependent: :destroy
  has_many :items, through: :cart_items, source: :product

  def add_product_to_cart(product)
    items << product
  end

  def total_price
    sum = 0

    cart_items.each do |cart_item|
      sum = sum + (cart_item.product.price * cart_item.quantity)
    end

    return sum
  end

  def clean!
    cart_items.destroy_all
  end
end
