# frozen_string_literal: true

require 'test_helper'

class MeControllerTest < ActionDispatch::IntegrationTest
  test 'returns current user teams' do
    user = users(:one)
    get api_v1_teams_url, headers: { Authorization: "token #{user.api_tokens.first.token}" }
    assert_response :success
    assert_includes response.parsed_body.map { |t| t['name'] }, user.teams.first.name
  end
end
