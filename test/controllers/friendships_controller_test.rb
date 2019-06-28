require 'test_helper'

class FriendshipsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @friendship = Friendship.create(user: User.all[0], friend: User.all[1])
  end

  # test "should get index" do
  #   get friendships_url
  #   assert_response :success
  # end
  #
  # test "should get new" do
  #   get new_friendship_url
  #   assert_response :success
  # end

  test "should create friendship" do
    assert_difference('Friendship.count', 2) do
      post friendships_url, params: { friendship: { friend_id: User.all[2].id, user_id: User.all[3].id } }
    end

    assert_redirected_to home_user_path(Friendship.last.friend)
  end

  # test "should show friendship" do
  #   get friendship_url(@friendship)
  #   assert_response :success
  # end

  # test "should get edit" do
  #   get edit_friendship_url(@friendship)
  #   assert_response :success
  # end
  #
  # test "should update friendship" do
  #   patch friendship_url(@friendship), params: { friendship: { friend_id: @friendship.friend_id, user_id: @friendship.user_id } }
  #   assert_redirected_to friendship_url(@friendship)
  # end

  test "should destroy friendship" do
    assert_difference('Friendship.count', -2) do
      delete friendship_url(@friendship)
    end

    assert_redirected_to home_user_path(@friendship.user)
  end
end
