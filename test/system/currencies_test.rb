require "application_system_test_case"

class CurrenciesTest < ApplicationSystemTestCase
  setup do
    @currency = currencies(:one)
  end

  test "visiting the index" do
    visit currencies_url
    assert_selector "h1", text: "Currencies"
  end

  test "creating a Currency" do
    visit currencies_url
    click_on "New Currency"

    fill_in "Code", with: @currency.code
    fill_in "Iso", with: @currency.iso
    fill_in "Name", with: @currency.name
    click_on "Create Currency"

    assert_text "Currency was successfully created"
    assert_selector "h1", text: "Currencies"
  end

  test "updating a Currency" do
    visit currency_url(@currency)
    click_on "Edit", match: :first

    fill_in "Code", with: @currency.code
    fill_in "Iso", with: @currency.iso
    fill_in "Name", with: @currency.name
    click_on "Update Currency"

    assert_text "Currency was successfully updated"
    assert_selector "h1", text: "Currencies"
  end

  test "destroying a Currency" do
    visit edit_currency_url(@currency)
    click_on "Delete", match: :first
    click_on "Confirm"

    assert_text "Currency was successfully destroyed"
  end
end
