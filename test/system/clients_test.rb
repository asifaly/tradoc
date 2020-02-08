require "application_system_test_case"

class ClientsTest < ApplicationSystemTestCase
  setup do
    @client = clients(:one)
  end

  test "visiting the index" do
    visit clients_url
    assert_selector "h1", text: "Clients"
  end

  test "creating a Client" do
    visit clients_url
    click_on "New Client"

    fill_in "Name", with: @client.name
    fill_in "Team", with: @client.team_id
    fill_in "User", with: @client.user_id
    click_on "Create Client"

    assert_text "Client was successfully created"
    assert_selector "h1", text: "Clients"
  end

  test "updating a Client" do
    visit client_url(@client)
    click_on "Edit", match: :first

    fill_in "Name", with: @client.name
    fill_in "Team", with: @client.team_id
    fill_in "User", with: @client.user_id
    click_on "Update Client"

    assert_text "Client was successfully updated"
    assert_selector "h1", text: "Clients"
  end

  test "destroying a Client" do
    visit edit_client_url(@client)
    click_on "Delete", match: :first
    click_on "Confirm"

    assert_text "Client was successfully destroyed"
  end
end
