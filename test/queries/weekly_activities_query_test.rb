# frozen_string_literal: true

require "test_helper"

class WeeklyActivitiesQueryTest < ActiveSupport::TestCase
  setup do
    @user = users :user
  end

  test "without params returns habits in the current week" do
    habits = WeeklyActivitiesQuery.new(Habit.where(user: @user)).all
    assert_equal [habits(:journal), habits(:meditate), habits(:sleep)], habits
  end

  test "without params includes activities in the current week" do
    query = WeeklyActivitiesQuery.new(Habit.where(name: "Journal"))

    start_date = Time.zone.now.to_date.beginning_of_week
    end_date = start_date.end_of_week
    weekly_activities = Activity.where(
      habit: habits(:journal),
      performed_at: start_date..end_date
    )

    assert_equal weekly_activities, query.all.first.activities
  end

  test "with params includes activities in the given week" do
    start_date = Date.parse("2019-01-01").beginning_of_week

    habit = habits :journal
    activity = Activity.create! habit: habit, performed_at: start_date

    query = WeeklyActivitiesQuery.new(
      Habit.where(id: habit.id),
      start_date: start_date
    )

    assert_equal [activity], query.all.first.activities
  end
end
