require "application_system_test_case"

class FabricsTest < ApplicationSystemTestCase
  setup do
    @fabric = fabrics(:one)
  end

  test "visiting the index" do
    visit fabrics_url
    assert_selector "h1", text: "Fabrics"
  end

  test "creating a Fabric" do
    visit fabrics_url
    click_on "New Fabric"

    fill_in "Fabric color", with: @fabric.fabric_color
    fill_in "Fabric composition", with: @fabric.fabric_composition
    fill_in "Fabric count", with: @fabric.fabric_count
    fill_in "Fabric", with: @fabric.fabric_id
    fill_in "Fabric knitting way", with: @fabric.fabric_knitting_way
    fill_in "Fabric price", with: @fabric.fabric_price
    fill_in "Fabric weight", with: @fabric.fabric_weight
    fill_in "Fabric yarn count", with: @fabric.fabric_yarn_count
    click_on "Create Fabric"

    assert_text "Fabric was successfully created"
    click_on "Back"
  end

  test "updating a Fabric" do
    visit fabrics_url
    click_on "Edit", match: :first

    fill_in "Fabric color", with: @fabric.fabric_color
    fill_in "Fabric composition", with: @fabric.fabric_composition
    fill_in "Fabric count", with: @fabric.fabric_count
    fill_in "Fabric", with: @fabric.fabric_id
    fill_in "Fabric knitting way", with: @fabric.fabric_knitting_way
    fill_in "Fabric price", with: @fabric.fabric_price
    fill_in "Fabric weight", with: @fabric.fabric_weight
    fill_in "Fabric yarn count", with: @fabric.fabric_yarn_count
    click_on "Update Fabric"

    assert_text "Fabric was successfully updated"
    click_on "Back"
  end

  test "destroying a Fabric" do
    visit fabrics_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Fabric was successfully destroyed"
  end
end
