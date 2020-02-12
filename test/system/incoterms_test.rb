require "application_system_test_case"

class IncotermsTest < ApplicationSystemTestCase
  setup do
    @incoterm = incoterms(:one)
  end

  test "visiting the index" do
    visit incoterms_url
    assert_selector "h1", text: "Incoterms"
  end

  test "creating a Incoterm" do
    visit incoterms_url
    click_on "New Incoterm"

    fill_in "Code", with: @incoterm.code
    fill_in "Description", with: @incoterm.description
    click_on "Create Incoterm"

    assert_text "Incoterm was successfully created"
    assert_selector "h1", text: "Incoterms"
  end

  test "updating a Incoterm" do
    visit incoterm_url(@incoterm)
    click_on "Edit", match: :first

    fill_in "Code", with: @incoterm.code
    fill_in "Description", with: @incoterm.description
    click_on "Update Incoterm"

    assert_text "Incoterm was successfully updated"
    assert_selector "h1", text: "Incoterms"
  end

  test "destroying a Incoterm" do
    visit edit_incoterm_url(@incoterm)
    click_on "Delete", match: :first
    click_on "Confirm"

    assert_text "Incoterm was successfully destroyed"
  end
end
