# frozen_string_literal: true

require "application_system_test_case"

class HabitsTest < ApplicationSystemTestCase
  setup do
    @user = users(:user)
    @habit = habits(:sleep)
  end

  test "visiting the index" do
    visit habits_url(as: @user)
    assert_selector "h1", text: "Habits"
  end

  test "creating a Habit" do
    visit root_url(as: @user)
    click_on I18n.t("dashboard.weeks.index.settings")

    click_on I18n.t("habits.index.new")

    fill_in "Name", with: "HabitsTest"
    click_on "Create Habit"

    assert_text "Habit was successfully created"
  end

  test "updating a Habit" do
    visit root_url(as: @user)
    click_on I18n.t("dashboard.weeks.index.settings")

    click_on "Rename", match: :first

    fill_in "Name", with: "HabitsTest"
    click_on "Update Habit"

    assert_text "Habit was successfully updated"
  end

  test "destroying a Habit" do
    visit root_url(as: @user)
    click_on I18n.t("dashboard.weeks.index.settings")

    page.accept_confirm do
      click_on "Delete", match: :first
    end

    assert_text "Habit was successfully destroyed"
  end
end
