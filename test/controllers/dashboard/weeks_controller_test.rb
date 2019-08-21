# frozen_string_literal: true

require "test_helper"

class Dashboard::WeeksControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = users :user
  end

  test "should show weekly dashboard" do
    get track_url(as: @user)
    assert_response :success
  end
end
