# frozen_string_literal: true

require "test_helper"

class WeeklyActivitiesQueryTest < ActiveSupport::TestCase
  setup do
    @user = users :user
  end

  test "#habits without params returns all habits" do
    habits = WeeklyActivitiesQuery.new(Habit.where(user: @user)).habits
    assert_equal [habits(:journal), habits(:meditate), habits(:sleep)], habits
  end

  test "#activities without params returns activities in the current week" do
    query = WeeklyActivitiesQuery.new(Habit.where(name: "Sleep"))
    assert_equal [activities(:sleep)], query.activities
  end

  test "#habits with params returns all habits" do
    start_date = Date.parse("2019-01-01").beginning_of_week

    habits = WeeklyActivitiesQuery.new(
      Habit.where(user: @user),
      start_date: start_date
    ).habits

    assert_equal [habits(:journal), habits(:meditate), habits(:sleep)], habits
  end

  test "#activities with params returns activities in the given week" do
    start_date = Date.parse("2019-01-01").beginning_of_week

    habit = habits :journal
    activity = Activity.create! habit: habit, performed_at: start_date

    query = WeeklyActivitiesQuery.new(
      Habit.where(id: habit.id),
      start_date: start_date
    )

    assert_equal [activity], query.activities
  end
end
