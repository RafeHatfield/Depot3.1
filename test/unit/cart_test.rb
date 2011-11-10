require 'test_helper'

class CartTest < ActiveSupport::TestCase
  test "cart line item should save price" do
    cart = carts(:cart1)
    [:ruby, :loremipsum, :ruby].each do |which_product|
      product = products(which_product)
      item = cart.add_product product.id
      assert_equal item.price, product.price,
        "cart line item did not save price" 
    end
  end

  test "cart line item quantity should increment" do
    cart = carts(:cart2)
    product = products(:ruby)
    multiple = 3
    multiple.times { cart.add_product product.id }
    item = cart.line_items.find_by_product_id product.id    
    assert_equal multiple, item.quantity,
      "cart line item quantity is incorrect" 
  end

  test "cart line item price should equal most-recent price" do
    cart = carts(:cart3)
    product = products(:ruby)
    sale_price = 0.8 * product.price
    [product.price, sale_price, 100].each do |price|
      cart.add_product product.id, price
      item = cart.line_items.find_by_product_id product.id
      assert_equal price, item.price,
        "price #{item.price} is incorrect; should be #{price}" 
    end
  end

  test "cart should be created and destroyed" do
    assert_same Cart.count, Cart.destroy_all.count,
      "unable to destroy existing carts" 
    Cart.create
    assert_equal 1, Cart.count, "unable to create cart" 
    assert_equal 1, Cart.destroy_all.count, "unable to destroy cart" 
  end
end