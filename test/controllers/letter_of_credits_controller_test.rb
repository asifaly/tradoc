# frozen_string_literal: true

require 'test_helper'

class LetterOfCreditsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @letter_of_credit = letter_of_credits(:one)
  end

  test 'should get index' do
    get letter_of_credits_url
    assert_response :success
  end

  test 'should get new' do
    get new_letter_of_credit_url
    assert_response :success
  end

  test 'should create letter_of_credit' do
    assert_difference('LetterOfCredit.count') do
      post letter_of_credits_url, params: { letter_of_credit: { client: @letter_of_credit.client, comment: @letter_of_credit.comment, expiry_date: @letter_of_credit.expiry_date, lc_number: @letter_of_credit.lc_number, team_id: @letter_of_credit.team_id, user_id: @letter_of_credit.user_id } }
    end

    assert_redirected_to letter_of_credit_url(LetterOfCredit.last)
  end

  test 'should show letter_of_credit' do
    get letter_of_credit_url(@letter_of_credit)
    assert_response :success
  end

  test 'should get edit' do
    get edit_letter_of_credit_url(@letter_of_credit)
    assert_response :success
  end

  test 'should update letter_of_credit' do
    patch letter_of_credit_url(@letter_of_credit), params: { letter_of_credit: { client: @letter_of_credit.client, comment: @letter_of_credit.comment, expiry_date: @letter_of_credit.expiry_date, lc_number: @letter_of_credit.lc_number, team_id: @letter_of_credit.team_id, user_id: @letter_of_credit.user_id } }
    assert_redirected_to letter_of_credit_url(@letter_of_credit)
  end

  test 'should destroy letter_of_credit' do
    assert_difference('LetterOfCredit.count', -1) do
      delete letter_of_credit_url(@letter_of_credit)
    end

    assert_redirected_to letter_of_credits_url
  end
end
