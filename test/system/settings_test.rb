# frozen_string_literal: true

require "application_system_test_case"

class SettingsTest < ApplicationSystemTestCase
  setup do
    @user = users :user
    @settings = @user.settings
  end

  test "updating the settings" do
    visit edit_settings_url(as: @user)

    time_before = Time.zone.now.utc
    assert_text I18n.l(time_before, format: :short)

    find("#settings_time_zone").find(:xpath, "option[2]").select_option
    click_on "Save"

    assert_text "Settings were successfully updated."
    assert_text I18n.l(time_before - 11.hours, format: :short)
  end
end
