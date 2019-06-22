require 'test_helper'

class HeadingsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @heading = headings(:one)
  end

  test "should get index" do
    get headings_url
    assert_response :success
  end

  test "should get new" do
    get new_heading_url
    assert_response :success
  end

  test "should create heading" do
    assert_difference('Heading.count') do
      post headings_url, params: { heading: { html_element: @heading.html_element, html_type: @heading.html_type, html_value: @heading.html_value, user_id: @heading.user_id } }
    end

    assert_redirected_to heading_url(Heading.last)
  end

  test "should show heading" do
    get heading_url(@heading)
    assert_response :success
  end

  test "should get edit" do
    get edit_heading_url(@heading)
    assert_response :success
  end

  test "should update heading" do
    patch heading_url(@heading), params: { heading: { html_element: @heading.html_element, html_type: @heading.html_type, html_value: @heading.html_value, user_id: @heading.user_id } }
    assert_redirected_to heading_url(@heading)
  end

  test "should destroy heading" do
    assert_difference('Heading.count', -1) do
      delete heading_url(@heading)
    end

    assert_redirected_to headings_url
  end
end
