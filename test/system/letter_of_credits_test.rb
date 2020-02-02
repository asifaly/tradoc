# frozen_string_literal: true

require 'application_system_test_case'

class LetterOfCreditsTest < ApplicationSystemTestCase
  setup do
    @letter_of_credit = letter_of_credits(:one)
  end

  test 'visiting the index' do
    visit letter_of_credits_url
    assert_selector 'h1', text: 'Letter Of Credits'
  end

  test 'creating a Letter of credit' do
    visit letter_of_credits_url
    click_on 'New Letter Of Credit'

    fill_in 'Client', with: @letter_of_credit.client
    fill_in 'Comment', with: @letter_of_credit.comment
    fill_in 'Expiry date', with: @letter_of_credit.expiry_date
    fill_in 'Lc number', with: @letter_of_credit.lc_number
    fill_in 'Team', with: @letter_of_credit.team_id
    fill_in 'User', with: @letter_of_credit.user_id
    click_on 'Create Letter of credit'

    assert_text 'Letter of credit was successfully created'
    assert_selector 'h1', text: 'Letter Of Credits'
  end

  test 'updating a Letter of credit' do
    visit letter_of_credit_url(@letter_of_credit)
    click_on 'Edit', match: :first

    fill_in 'Client', with: @letter_of_credit.client
    fill_in 'Comment', with: @letter_of_credit.comment
    fill_in 'Expiry date', with: @letter_of_credit.expiry_date
    fill_in 'Lc number', with: @letter_of_credit.lc_number
    fill_in 'Team', with: @letter_of_credit.team_id
    fill_in 'User', with: @letter_of_credit.user_id
    click_on 'Update Letter of credit'

    assert_text 'Letter of credit was successfully updated'
    assert_selector 'h1', text: 'Letter Of Credits'
  end

  test 'destroying a Letter of credit' do
    visit edit_letter_of_credit_url(@letter_of_credit)
    click_on 'Delete', match: :first
    click_on 'Confirm'

    assert_text 'Letter of credit was successfully destroyed'
  end
end
