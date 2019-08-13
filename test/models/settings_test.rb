# frozen_string_literal: true

require "test_helper"

class SettingsTest < ActiveSupport::TestCase
  test "valid from the fixture" do
    assert settings(:user).valid?
  end

  test "time zone defaults to UTC" do
    settings = Settings.create! user: users(:user)

    assert_equal "UTC", settings.reload.time_zone
  end
end
