require "application_system_test_case"

class TopPagesTest < ApplicationSystemTestCase
  setup do
    @top_page = top_pages(:one)
  end

  test "visiting the index" do
    visit top_pages_url
    assert_selector "h1", text: "Top Pages"
  end

  test "creating a Top page" do
    visit top_pages_url
    click_on "New Top Page"

    click_on "Create Top page"

    assert_text "Top page was successfully created"
    click_on "Back"
  end

  test "updating a Top page" do
    visit top_pages_url
    click_on "Edit", match: :first

    click_on "Update Top page"

    assert_text "Top page was successfully updated"
    click_on "Back"
  end

  test "destroying a Top page" do
    visit top_pages_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Top page was successfully destroyed"
  end
end
