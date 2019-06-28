require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test "the truth" do
    assert true
  end

  test "shortest path" do
    a = users(:one)
    b = users(:two)
    c = users(:three)

    f_a_b = Friendship.create(user: a, friend: b)
    f_b_c = Friendship.create(user: b, friend: c)

    shortest_path = User.shortest_path a, c
    assert shortest_path == [a, b, c]
  end
end
