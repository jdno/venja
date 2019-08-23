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

  test "create activity" do
    visit track_url(as: @user)

    assert_difference ["Activity.count"], 1 do
      page.first('a[data-action="activities#create"]').click
    end
  end

  test "destroy activity" do
    visit track_url(as: @user)

    assert_difference ["Activity.count"], -1 do
      page.first('a[data-action="activities#destroy"]').click
    end
  end
end
