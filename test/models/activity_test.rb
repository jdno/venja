# frozen_string_literal: true

require "test_helper"

class ActivityTest < ActiveSupport::TestCase
  setup do
    @activity = activities :sleep
  end

  test "valid from the fixture" do
    assert @activity.valid?
  end
end
