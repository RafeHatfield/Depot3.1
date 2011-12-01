require 'test_helper'

class CartTest < ActiveSupport::TestCase

	test "unique_product_should_be_saved" do
    product = Product.new(:title => "unique-title",
                          :description => "a unique product",
                          :image_url => "unique.png",
                          :price => 22)
    assert product.save

  end

  test "non_unique_product_should_error_out" do
    product1 = Product.new(:title => "unique-title",
                          :description => "a unique product",
                          :image_url => "unique.png",
                          :price => 22)
    product2 = Product.new(:title => "unique-title",
                          :description => "a unique product",
                          :image_url => "unique.png",
                          :price => 22)
		product1.save!
    assert !product2.save
    assert_equal "has already been taken", product2.errors[:title].join('; ')
  end

end