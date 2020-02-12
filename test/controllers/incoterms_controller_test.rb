require 'test_helper'

class IncotermsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @incoterm = incoterms(:one)
  end

  test "should get index" do
    get incoterms_url
    assert_response :success
  end

  test "should get new" do
    get new_incoterm_url
    assert_response :success
  end

  test "should create incoterm" do
    assert_difference('Incoterm.count') do
      post incoterms_url, params: { incoterm: { code: @incoterm.code, description: @incoterm.description } }
    end

    assert_redirected_to incoterm_url(Incoterm.last)
  end

  test "should show incoterm" do
    get incoterm_url(@incoterm)
    assert_response :success
  end

  test "should get edit" do
    get edit_incoterm_url(@incoterm)
    assert_response :success
  end

  test "should update incoterm" do
    patch incoterm_url(@incoterm), params: { incoterm: { code: @incoterm.code, description: @incoterm.description } }
    assert_redirected_to incoterm_url(@incoterm)
  end

  test "should destroy incoterm" do
    assert_difference('Incoterm.count', -1) do
      delete incoterm_url(@incoterm)
    end

    assert_redirected_to incoterms_url
  end
end
