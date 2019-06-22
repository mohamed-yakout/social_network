require "application_system_test_case"

class HeadingsTest < ApplicationSystemTestCase
  setup do
    @heading = headings(:one)
  end

  test "visiting the index" do
    visit headings_url
    assert_selector "h1", text: "Headings"
  end

  test "creating a Heading" do
    visit headings_url
    click_on "New Heading"

    fill_in "Html element", with: @heading.html_element
    fill_in "Html type", with: @heading.html_type
    fill_in "Html value", with: @heading.html_value
    fill_in "User", with: @heading.user_id
    click_on "Create Heading"

    assert_text "Heading was successfully created"
    click_on "Back"
  end

  test "updating a Heading" do
    visit headings_url
    click_on "Edit", match: :first

    fill_in "Html element", with: @heading.html_element
    fill_in "Html type", with: @heading.html_type
    fill_in "Html value", with: @heading.html_value
    fill_in "User", with: @heading.user_id
    click_on "Update Heading"

    assert_text "Heading was successfully updated"
    click_on "Back"
  end

  test "destroying a Heading" do
    visit headings_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Heading was successfully destroyed"
  end
end
