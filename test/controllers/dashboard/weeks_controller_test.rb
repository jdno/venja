# frozen_string_literal: true

require "test_helper"

class Dashboard::WeeksControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = users :user
  end

  test "show current weekly dashboard without param" do
    get track_url(as: @user)
    assert_response :success
  end

  test "show current weekly dashboard with invalid param" do
    get track_url(date: "this is not a date", as: @user)
    assert_select "h1", "Week #{Time.zone.now.to_date.cweek}"
  end

  test "show past weekly dashboard with valid param" do
    date = "2019-01-01"

    get track_url(as: @user), params: { date: date }
    assert_select "h1", "Week #{Time.zone.parse(date).to_date.cweek}"
  end
end
