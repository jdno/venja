# frozen_string_literal: true

require "test_helper"

class ActivityTest < ActiveSupport::TestCase
  setup do
    @activity = activities :sleep
  end

  test "valid from the fixture" do
    assert @activity.valid?
  end

  test "invalid without a performed_at date" do
    @activity.performed_at = nil
    assert_not @activity.valid?
  end

  test "invalid when an activity has already been performed on the same day" do
    duplicate_activity = Activity.new(
      habit: @activity.habit,
      performed_at: @activity.performed_at
    )

    assert_not duplicate_activity.valid?
  end
end
