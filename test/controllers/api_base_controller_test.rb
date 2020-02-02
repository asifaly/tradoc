# frozen_string_literal: true

require 'test_helper'

class ApiBaseControllerTest < ActionDispatch::IntegrationTest
  test 'return 401 if not logged in' do
    get api_v1_me_url
    assert_response :unauthorized
  end

  test 'successful when user logged in' do
    get api_v1_me_url, headers: { Authorization: "token #{users(:one).api_tokens.first.token}" }
    assert_response :success
  end
end
