require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test "should not save a user without name" do
    user = User.new
    assert_not user.save
  end

  test "should save a user with name, email, password" do
    user = User.new(email: 'bat@man.com', name: 'Bruce', password: '123456')
    assert user.save
  end
end
