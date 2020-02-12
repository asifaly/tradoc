require "application_system_test_case"

class DocumentsTest < ApplicationSystemTestCase
  setup do
    @document = documents(:one)
  end

  test "visiting the index" do
    visit documents_url
    assert_selector "h1", text: "Documents"
  end

  test "creating a Document" do
    visit documents_url
    click_on "New Document"

    fill_in "Exw amount", with: @document.exw_amount
    fill_in "Final destination", with: @document.final_destination
    fill_in "Fob amount", with: @document.fob_amount
    fill_in "Freight amount", with: @document.freight_amount
    fill_in "Incoterm", with: @document.incoterm_id
    fill_in "Issue date", with: @document.issue_date
    fill_in "Issuing bank", with: @document.issuing_bank
    fill_in "Letter of credit", with: @document.letter_of_credit_id
    fill_in "Place of receipt", with: @document.place_of_receipt
    fill_in "Port of discharge", with: @document.port_of_discharge
    fill_in "Port of loading", with: @document.port_of_loading
    fill_in "Shipment date", with: @document.shipment_date
    fill_in "Team", with: @document.team_id
    fill_in "Total amount", with: @document.total_amount
    fill_in "User", with: @document.user_id
    click_on "Create Document"

    assert_text "Document was successfully created"
    assert_selector "h1", text: "Documents"
  end

  test "updating a Document" do
    visit document_url(@document)
    click_on "Edit", match: :first

    fill_in "Exw amount", with: @document.exw_amount
    fill_in "Final destination", with: @document.final_destination
    fill_in "Fob amount", with: @document.fob_amount
    fill_in "Freight amount", with: @document.freight_amount
    fill_in "Incoterm", with: @document.incoterm_id
    fill_in "Issue date", with: @document.issue_date
    fill_in "Issuing bank", with: @document.issuing_bank
    fill_in "Letter of credit", with: @document.letter_of_credit_id
    fill_in "Place of receipt", with: @document.place_of_receipt
    fill_in "Port of discharge", with: @document.port_of_discharge
    fill_in "Port of loading", with: @document.port_of_loading
    fill_in "Shipment date", with: @document.shipment_date
    fill_in "Team", with: @document.team_id
    fill_in "Total amount", with: @document.total_amount
    fill_in "User", with: @document.user_id
    click_on "Update Document"

    assert_text "Document was successfully updated"
    assert_selector "h1", text: "Documents"
  end

  test "destroying a Document" do
    visit edit_document_url(@document)
    click_on "Delete", match: :first
    click_on "Confirm"

    assert_text "Document was successfully destroyed"
  end
end
