# frozen_string_literal: true

require "test_helper"

class SettingsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = users :user
    @settings = @user.settings
  end

  test "should get edit" do
    get edit_settings_url(as: @user)
    assert_response :success
  end

  test "should update settings with valid params" do
    patch settings_url(as: @user), params: {
      settings: { time_zone: "Europe/Berlin" }
    }

    assert_redirected_to edit_settings_url
    assert_equal "Europe/Berlin", @settings.reload.time_zone
  end
end
