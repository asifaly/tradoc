# frozen_string_literal: true

require 'test_helper'

class CurrentHelperTest < ActionView::TestCase
  attr_reader :current_user

  setup do
    @current_user = users(:one)
    @current_team = nil
    @current_team_member = nil
    session[:team_id] = nil
  end

  test 'current_team' do
    assert_not_nil current_team
  end

  test 'uses team from session' do
    # The first team is the fallback, so we want to check that it uses the second team
    team = current_user.teams.last
    session[:team_id] = team.id
    assert_equal team, current_team
  end

  test 'creates a team if none exist' do
    @current_user = users(:noteam)
    assert_empty current_user.teams
    assert_not_nil current_team
  end

  test 'current_team_member' do
    assert_not_nil current_team_member
  end

  test 'current_team_admin returns true for an admin' do
    @current_team_member = team_members(:two)
    assert current_team_admin?
  end

  test 'current_team_admin returns false for a non admin' do
    @current_team_member = team_members(:company_regular_user)
    assert_not current_team_admin?
  end

  test 'current team member is from current team' do
    team_member = current_user.team_members.last
    session[:team_id] = team_member.team_id
    assert_equal team_member, current_team_member
  end

  test 'current_roles' do
    @current_team = teams(:company)
    assert_equal [:admin], current_roles
  end
end
