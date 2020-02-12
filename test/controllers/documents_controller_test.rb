require 'test_helper'

class DocumentsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @document = documents(:one)
  end

  test "should get index" do
    get documents_url
    assert_response :success
  end

  test "should get new" do
    get new_document_url
    assert_response :success
  end

  test "should create document" do
    assert_difference('Document.count') do
      post documents_url, params: { document: { exw_amount: @document.exw_amount, final_destination: @document.final_destination, fob_amount: @document.fob_amount, freight_amount: @document.freight_amount, incoterm_id: @document.incoterm_id, issue_date: @document.issue_date, issuing_bank: @document.issuing_bank, letter_of_credit_id: @document.letter_of_credit_id, place_of_receipt: @document.place_of_receipt, port_of_discharge: @document.port_of_discharge, port_of_loading: @document.port_of_loading, shipment_date: @document.shipment_date, team_id: @document.team_id, total_amount: @document.total_amount, user_id: @document.user_id } }
    end

    assert_redirected_to document_url(Document.last)
  end

  test "should show document" do
    get document_url(@document)
    assert_response :success
  end

  test "should get edit" do
    get edit_document_url(@document)
    assert_response :success
  end

  test "should update document" do
    patch document_url(@document), params: { document: { exw_amount: @document.exw_amount, final_destination: @document.final_destination, fob_amount: @document.fob_amount, freight_amount: @document.freight_amount, incoterm_id: @document.incoterm_id, issue_date: @document.issue_date, issuing_bank: @document.issuing_bank, letter_of_credit_id: @document.letter_of_credit_id, place_of_receipt: @document.place_of_receipt, port_of_discharge: @document.port_of_discharge, port_of_loading: @document.port_of_loading, shipment_date: @document.shipment_date, team_id: @document.team_id, total_amount: @document.total_amount, user_id: @document.user_id } }
    assert_redirected_to document_url(@document)
  end

  test "should destroy document" do
    assert_difference('Document.count', -1) do
      delete document_url(@document)
    end

    assert_redirected_to documents_url
  end
end
