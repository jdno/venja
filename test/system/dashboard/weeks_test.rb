# frozen_string_literal: true

require "application_system_test_case"

class Dashboard::WeeksTest < ApplicationSystemTestCase
  setup do
    @user = users :user
  end

  test "show the weekly dashboard" do
    visit track_url(as: @user)

    current_week = Time.zone.now.to_date.cweek
    assert_text "Week #{current_week}"
  end
end
