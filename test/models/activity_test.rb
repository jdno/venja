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
end
