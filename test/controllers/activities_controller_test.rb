# frozen_string_literal: true

require "test_helper"

class ActivitiesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = users(:user)
    @habit = habits(:sleep)
    @activity = activities(:sleep)
  end

  test "should create activity" do
    date = Time.zone.now + 1.month

    assert_difference("Activity.count") do
      post habit_activities_url(@habit, as: @user), params: {
        activity: { performed_at: date }
      }
    end

    assert_redirected_to track_url
  end

  test "should destroy activity" do
    assert_difference("Activity.count", -1) do
      delete habit_activity_url(@habit, @activity, as: @user)
    end

    assert_redirected_to track_url
  end
end
