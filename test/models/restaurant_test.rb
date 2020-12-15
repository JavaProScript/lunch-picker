require 'test_helper'

class RestaurantTest < ActiveSupport::TestCase
  test "should not save a restaurant with a wrong style" do
    restaurant = Restaurant.new(name: 'Futon Factory', style: 'Futon & Tatamis', address: "8 Rue d'Argenteuil, 75001 Paris, France", price: 20)
    assert_not restaurant.save, "Saved the restaurant with a bad style"
  end

  test "should not save a restaurant with no name" do
    restaurant = Restaurant.new(address: "13 rue van Aa 1050 Ixelles Belgique", style: 'Belgian', price: '20')
    assert_not restaurant.save, "Saved the restaurant with no name"
  end

  test "should save a restaurant with everything correct" do
    restaurant = Restaurant.new(name: 'Exki Porte de Namur', style: 'Belgian', address: "Chaussée d'Ixelles 12, 1050 Bruxelles", price: 20)
    assert restaurant.save, "Didn't save a correct restaurant"
  end
end
